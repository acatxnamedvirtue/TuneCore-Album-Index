require 'rails_helper'

RSpec.describe Song, type: :model do
  subject {FactoryGirl.create(:song)}

  describe 'Associations' do
    it {should have_one(:artist)}
    it {should belong_to(:album)}
  end

  describe 'Validations' do
    it {should be_valid}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:album_id)}
    it {should validate_presence_of(:track_number)}
    it {should validate_presence_of(:length)}
  end

  describe 'Search' do
    it 'should return all songs if no query is given' do
      FactoryGirl.create_list(:song, 10)

      results = Song.search(nil)
      expect(results.length).to eq 10
    end

    it 'should return only songs that match if a query is given' do
      FactoryGirl.create_list(:matching_song, 10)
      FactoryGirl.create_list(:not_matching_song, 10)

      results = Song.search('songs')
      expect(results.length).to eq 10
    end

    it 'should match based on Artist Name, Album Title, or Song Title' do
      FactoryGirl.create_list(:matching_song, 10)
      FactoryGirl.create_list(:not_matching_song, 10)

      artist_results = Song.search('artists')
      expect(artist_results.length).to eq 10

      album_results = Song.search('albums')
      expect(album_results.length).to eq 10

      song_results = Song.search('songs')
      expect(song_results.length).to eq 10
    end

    it 'should match for any combination of Artist Name, Album Title, or Song Title' do
      FactoryGirl.create_list(:matching_song, 10)

      artists_albums_results = Song.search('artists albums')
      artists_songs_results = Song.search('artists songs')
      songs_albums_results = Song.search('songs albums')
      artists_albums_songs_results = Song.search('songs albums artists')

      expect(artists_albums_results.length).to eq 10
      expect(artists_songs_results.length).to eq 10
      expect(songs_albums_results.length).to eq 10
      expect(artists_albums_songs_results.length).to eq 10
    end
  end
end
