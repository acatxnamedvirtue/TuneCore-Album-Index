class Song < ApplicationRecord
  belongs_to :album, class_name: 'Album'
  has_one :artist, through: :album

  validates_presence_of :title, :album_id, :track_number, :length

  def self.search(search)
    Song.joins(:album).joins(:artist)
        .where('songs.title LIKE ? OR albums.title LIKE ? OR artists.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def album_title
    self.album_id ? self.album.title : ''
  end

  def format_length
    Time.at(self.length).utc.strftime("%-M:%S")
  end
end
