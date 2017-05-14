class AddFullTextIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :songs, "to_tsvector('english', title)", using: :gin, name: 'song_title_idx'
    add_index :albums, "to_tsvector('english', title)", using: :gin, name: 'album_title_idx'
    add_index :artists, "to_tsvector('english', name)", using: :gin, name: 'artist_name_idx'
  end
end
