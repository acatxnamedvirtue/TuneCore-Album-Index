class Song < ApplicationRecord
  validates_presence_of :title, :album_title, :artist_name, :track_number, :length

  def format_length
    Time.at(self.length).utc.strftime('%-M:%S')
  end
end
