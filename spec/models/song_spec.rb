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
end
