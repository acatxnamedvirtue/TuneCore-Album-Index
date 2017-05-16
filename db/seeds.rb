require 'faker'

10.times {
  artist_name = Faker::RockBand.name
  10.times {
    album_title = Faker::Book.title
    5.times do |x|
      Song.create(title: Faker::Book.title,
                  track_number: x+1,
                  length: Faker::Number.between(60, 600),
                  album_title: album_title,
                  artist_name: artist_name)
    end
  }
}