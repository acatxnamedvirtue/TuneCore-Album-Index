json.extract! album, :id, :title, :artist_id, :year, :genre, :created_at, :updated_at
json.url album_url(album, format: :json)
