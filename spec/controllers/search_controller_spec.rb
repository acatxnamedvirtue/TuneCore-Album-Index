require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:valid_attributes) {
    {title: 'title', album_title: 'album title', artist_name: 'artist name', track_number: 1, length: 9000}
  }

  let(:invalid_attributes) {
    {title: nil, album_title: nil, artist_name: nil, track_number: nil, length: nil}
  }

  let(:valid_session) {{}}

  describe 'SEARCH #search' do
    it 'returns a success response with no search param' do
      song = Song.create! valid_attributes
      get :search, params: {}, session: valid_session
      expect(response).to be_success
    end

    it 'returns a success response with a search paramm' do
      song = Song.create! valid_attributes
      post :search, params: {search: song.title}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'Search Logic' do
    it 'should return all songs if no query is given' do
      FactoryGirl.create_list(:song, 5)
      response = get :search, params: {}, session: valid_session
      expect(assigns(:songs).length).to be 5
    end

    it 'should return only songs that match if a query is given' do
      FactoryGirl.create_list(:matching_song, 5)
      FactoryGirl.create_list(:not_matching_song, 5)
      post :search, params: {search: 'songs'}, session: valid_session
      expect(assigns(:songs).length).to be 5
    end

    it 'should match based on Artist Name, Album Title, or Song Title' do
      FactoryGirl.create_list(:matching_song, 5)
      FactoryGirl.create_list(:not_matching_song, 5)

      get :search, params: {search: 'artists'}, session: valid_session
      expect(assigns(:songs).length).to be 5

      get :search, params: {search: 'albums'}, session: valid_session
      expect(assigns(:songs).length).to be 5

      get :search, params: {search: 'songs'}, session: valid_session
      expect(assigns(:songs).length).to be 5
    end

    it 'should match for any combination of Artist Name, Album Title, or Song Title' do
      FactoryGirl.create_list(:matching_song, 5)
      FactoryGirl.create_list(:not_matching_song, 5)

      get :search, params: {search: 'artists albums'}, session: valid_session
      expect(assigns(:songs).length).to be 5

      get :search, params: {search: 'artists songs'}, session: valid_session
      expect(assigns(:songs).length).to be 5

      get :search, params: {search: 'songs albums'}, session: valid_session
      expect(assigns(:songs).length).to be 5

      get :search, params: {search: 'artists albums songs'}, session: valid_session
      expect(assigns(:songs).length).to be 5
    end
  end
end