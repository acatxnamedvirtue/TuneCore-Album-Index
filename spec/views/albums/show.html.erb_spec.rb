require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :title => "Title",
      :artist_id => 2,
      :year => "Year",
      :genre => "Genre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Genre/)
  end
end
