require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "MyString",
      :artist_id => 1,
      :year => "MyString",
      :genre => "MyString"
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_title[name=?]", "album[title]"

      assert_select "input#album_artist_id[name=?]", "album[artist_id]"

      assert_select "input#album_year[name=?]", "album[year]"

      assert_select "input#album_genre[name=?]", "album[genre]"
    end
  end
end
