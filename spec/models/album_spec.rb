require 'rails_helper'

RSpec.describe Album, type: :model do
  subject {FactoryGirl.create(:album)}

  describe 'Associations' do
    it {should belong_to(:artist)}
    it {should have_many(:songs)}
  end

  describe 'Validations' do
    it {should be_valid}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:artist_id)}
    it {should validate_presence_of(:genre)}
    it {should validate_presence_of(:year)}
  end
end
