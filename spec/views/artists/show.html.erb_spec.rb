require 'rails_helper'

RSpec.describe 'artists/show', type: :view do
  before(:each) do
    @artist = assign(:artist, FactoryGirl.create(:artist))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@artist.name)
  end
end
