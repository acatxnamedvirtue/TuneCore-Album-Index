# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

genre = ['Rock', 'Pop', 'Punk', 'Indie', 'Alternative']

10.times {
  artist = Artist.create(name: Faker::RockBand.name)
  10.times {
    album = Album.create(title: Faker::Book.title,
                         artist_id: artist.id,
                         genre: genre[Random.rand(5)],
                         year: Faker::Date.between(70.years.ago, Date.today).year)
    5.times do |x|
      Song.create(title: Faker::Book.title,
                  track_number: x+1,
                  length: Faker::Number.between(60, 600),
                  album_id: album.id)
    end
  }
}



