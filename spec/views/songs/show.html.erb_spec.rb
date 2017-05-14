require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, FactoryGirl.create(:song))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@song.title)
    expect(rendered).to match(@song.album.title)
    expect(rendered).to match(@song.track_number.to_s)
    expect(rendered).to match(@song.length.to_s)
  end
end
