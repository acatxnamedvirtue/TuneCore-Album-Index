require 'rails_helper'

RSpec.describe 'albums/index', type: :view do
  before(:each) do
    @album1, @album2 = FactoryGirl.create(:album), FactoryGirl.create(:album)
    assign(:albums, [@album1, @album2])
  end

  it 'renders a list of albums' do
    render
    assert_select 'tr>td', :text => @album1.title, :count => 2
    assert_select 'tr>td', :text => @album1.artist_id.to_s, :count => 1
    assert_select 'tr>td', :text => @album2.artist_id.to_s, :count => 1
    assert_select 'tr>td', :text => @album1.year, :count => 2
    assert_select 'tr>td', :text => @album1.genre, :count => 2
  end
end
