class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :album_id
      t.integer :length

      t.timestamps
    end
  end
end
