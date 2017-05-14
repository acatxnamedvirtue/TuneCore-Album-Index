class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs
  validates_presence_of :title, :artist_id, :genre, :year
end
