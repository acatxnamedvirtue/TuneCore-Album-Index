class Song < ApplicationRecord
  belongs_to :album, class_name: 'Album'
  has_one :artist, through: :album

  validates_presence_of :title, :album_id, :track_number, :length

  def self.search(search)
    if search
      # find(:all, :conditions => ['songs.title LIK}E ?', "%#{search}%"])
      where('title LIKE ?', "%#{search}")
    else
      all()
    end
  end
end
