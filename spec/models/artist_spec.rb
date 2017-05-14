require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject {
    described_class.new(name: 'title')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has many albums' do
      should have_many(:albums)
    end

    it 'has many songs' do
      should have_many(:songs)
    end
  end
end
