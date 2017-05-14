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
      FactoryGirl.create_list(:song, 10)
      FactoryGirl.create_list(:not_matching_song, 10)

      results = Song.search('title')
      expect(results.length).to eq 10
    end
  end
end
