require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "Title",
        :album_id => 2,
        :artist_id => 3,
        :length => 4
      ),
      Song.create!(
        :title => "Title",
        :album_id => 2,
        :artist_id => 3,
        :length => 4
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
