require 'rails_helper'

RSpec.describe 'songs/index', type: :view do
  before(:each) do
    @song1 = FactoryGirl.create(:song)
    @song2 = FactoryGirl.create(:not_matching_song)

    assign(:songs, [@song1, @song2])
  end

  it 'renders a list of songs' do
    render
    assert_select 'tr>td', :text => @song1.title, :count => 1
    assert_select 'tr>td', :text => @song1.album.title, :count => 2
    assert_select 'tr>td', :text => @song1.track_number.to_s, :count => 1
    assert_select 'tr>td', :text => @song1.length.to_s, :count => 1

    assert_select 'tr>td', :text => @song2.title, :count => 1
    assert_select 'tr>td', :text => @song2.track_number.to_s, :count => 1
    assert_select 'tr>td', :text => @song2.length.to_s, :count => 1
  end
end
