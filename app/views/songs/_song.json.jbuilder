json.extract! song, :id, :title, :album_id, :track_number, :length, :created_at, :updated_at
json.url song_url(song, format: :json)
