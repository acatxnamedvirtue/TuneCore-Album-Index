require 'rails_helper'

RSpec.describe 'albums/show', type: :view do
  before(:each) do
    @album = assign(:album, FactoryGirl.create(:album))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@album.title)
    expect(rendered).to match(@album.artist_id.to_s)
    expect(rendered).to match(@album.year)
    expect(rendered).to match(@album.genre)
  end
end
