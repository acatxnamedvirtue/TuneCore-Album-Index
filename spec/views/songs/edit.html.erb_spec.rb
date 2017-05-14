require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyString",
      :album_id => 1,
      :artist_id => 1,
      :length => 1
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_album_id[name=?]", "song[album_id]"

      assert_select "input#song_artist_id[name=?]", "song[artist_id]"

      assert_select "input#song_length[name=?]", "song[length]"
    end
  end
end
