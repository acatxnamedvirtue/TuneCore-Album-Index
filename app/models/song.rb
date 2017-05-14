class Song < ApplicationRecord
  belongs_to :album, class_name: 'Album'
  has_one :artist, through: :album

  validates_presence_of :title, :album_id, :track_number, :length

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}")
    else
      all
    end
  end

  def album_title
    self.album_id ? self.album.title : ''
  end
end
