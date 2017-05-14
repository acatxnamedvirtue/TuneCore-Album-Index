class AddTrackNumberToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :track_number, :integer
  end
end
