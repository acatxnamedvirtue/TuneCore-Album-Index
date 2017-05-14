require 'rails_helper'

RSpec.describe Song, type: :model do
  subject {
    artist = Artist.create(name: 'title')
    album = Album.create(title: 'title', artist_id: artist.id, genre: 'genre', year: 'year')
    described_class.new(title: 'title', album_id: album.id, length: 9001)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an album_id' do
    subject.album_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a length' do
    subject.length = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has one artist' do
      should have_one(:artist)
    end

    it 'belongs to album' do
      should belong_to(:album)
    end
  end
end
