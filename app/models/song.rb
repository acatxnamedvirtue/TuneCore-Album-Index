class Song < ApplicationRecord
  validates_presence_of :title, :album_id, :artist_id, :length
end
