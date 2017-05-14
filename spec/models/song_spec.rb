require 'rails_helper'

RSpec.describe Song, type: :model do
  subject {
    described_class.new(title: 'title', album_id: 1, artist_id: 1, length: 9001)
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

  it 'is not valid without an artist_id' do
    subject.artist_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a length' do
    subject.length = nil
    expect(subject).to_not be_valid
  end
end
