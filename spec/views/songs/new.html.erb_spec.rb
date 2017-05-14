require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyString",
      :album_id => 1,
      :artist_id => 1,
      :length => 1
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_album_id[name=?]", "song[album_id]"

      assert_select "input#song_artist_id[name=?]", "song[artist_id]"

      assert_select "input#song_length[name=?]", "song[length]"
    end
  end
end
