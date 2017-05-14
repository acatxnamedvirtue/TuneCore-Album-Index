require 'rails_helper'

RSpec.describe Album, type: :model do
  subject {
    artist = Artist.create(name: 'title')
    described_class.new(title: 'title', artist_id: artist.id, genre: 'genre', year: '2017')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an artist_id' do
    subject.artist_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an genre' do
    subject.genre = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a year' do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'belongs to an artist' do
      should belong_to(:artist)
    end

    it 'has many songs' do
      should have_many(:songs)
    end
  end
end
