require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject {FactoryGirl.create(:artist)}

  describe 'Associations' do
    it {should have_many(:albums)}
    it {should have_many(:songs)}
  end

  describe 'Validations' do
    it {should be_valid}
    it {should validate_presence_of(:name)}
  end
end
