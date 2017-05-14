class Song < ApplicationRecord
  belongs_to :album, class_name: 'Album'
  has_one :artist, through: :album
  validates_presence_of :title, :album_id, :length
end
