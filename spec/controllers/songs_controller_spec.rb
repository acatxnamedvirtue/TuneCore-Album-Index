require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  let(:valid_attributes) {
    {title: 'title', album_id: FactoryGirl.create(:album).id, track_number: 1, length: 9000}
  }

  let(:invalid_attributes) {
    {title: nil, album_id: nil, track_number: nil, length: nil}
  }

  let(:create_attributes) {
    {title: 'title', album_title: FactoryGirl.create(:album).title, track_number: 1, length: 9000}
  }

  let(:invalid_create_attributes) {
    {title: nil, album_title: nil, track_number: nil, length: nil}
  }

  let(:valid_session) {{}}

  describe "GET #index" do
    it "returns a success response" do
      song = Song.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      song = Song.create! valid_attributes
      get :show, params: {id: song.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      song = Song.create! valid_attributes
      get :edit, params: {id: song.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, params: {song: create_attributes}, session: valid_session
        }.to change(Song, :count).by(1)
      end

      it "redirects to the created song" do
        post :create, params: {song: create_attributes}, session: valid_session
        expect(response).to redirect_to(Song.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {song: invalid_create_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'updated title'}
      }

      it "updates the requested song" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: new_attributes}, session: valid_session
        song.reload
        expect(song.title).to eq 'updated title'
      end

      it "redirects to the song" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: valid_attributes}, session: valid_session
        expect(response).to redirect_to(song)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        song = Song.create! valid_attributes
        put :update, params: {id: song.to_param, song: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, params: {id: song.to_param}, session: valid_session
      }.to change(Song, :count).by(-1)
    end

    it "redirects to the songs list" do
      song = Song.create! valid_attributes
      delete :destroy, params: {id: song.to_param}, session: valid_session
      expect(response).to redirect_to(songs_url)
    end
  end

end
