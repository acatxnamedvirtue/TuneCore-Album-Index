class Song < ApplicationRecord
  belongs_to :album, class_name: 'Album'
  has_one :artist, through: :album

  validates_presence_of :title, :album_id, :track_number, :length

  def self.search(search)
    return Song.all unless search
    Song.joins(:album).joins(:artist)
        .where("to_tsvector('english', songs.title || ' ' || artists.name || ' ' || albums.title) @@ to_tsquery('english', ?)",
               search.split(' ').join(' & '))

  end

  def album_title
    self.album_id ? self.album.title : ''
  end

  def format_length
    Time.at(self.length).utc.strftime('%-M:%S')
  end
end
