json.extract! song, :id, :title, :album_title, :artist_name, :track_number, :length, :created_at, :updated_at
json.url song_url(song, format: :json)
