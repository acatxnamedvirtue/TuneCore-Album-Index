class CreateSongs < ActiveRecord::Migration[5.0]
  if ActiveRecord::Base.connection.instance_values['config'][:adapter] == 'mysql2'

    def change
      create_table(:songs, options: 'ENGINE=MyISAM DEFAULT CHARSET=utf8') do |t|
        t.string :title
        t.string :album_title
        t.string :artist_name
        t.integer :track_number
        t.integer :length

        t.timestamps
      end

      add_index :songs, [:title, :album_title, :artist_name], name: 'song_album_artist_fulltext_index', type: :fulltext
    end
  elsif ActiveRecord::Base.connection.instance_values['config'][:adapter] == 'postgresql'
    def change
      create_table :songs do |t|
        t.string :title
        t.string :album_title
        t.string :artist_name
        t.integer :track_number
        t.integer :length

        t.timestamps
      end

      add_index :songs, "to_tsvector('english', title || ' ' || album_title || ' ' || artist_name)", using: :gin, name: 'song_album_artist_idx'
    end
  end
end
