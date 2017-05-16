require 'rails_helper'

RSpec.describe 'songs/index', type: :view do
  before(:each) do
    @song1 = FactoryGirl.create(:song)
    @song2 = FactoryGirl.create(:song2)

    assign(:songs, [@song1, @song2])
  end

  it 'renders a list of songs' do
    allow(view).to receive_messages(:will_paginate => nil)
    render
    assert_select 'tr>td', :text => @song1.title, :count => 1
    assert_select 'tr>td', :text => @song1.album_title, :count => 1
    assert_select 'tr>td', :text => @song1.artist_name, :count => 1
    assert_select 'tr>td', :text => @song1.track_number.to_s, :count => 1
    assert_select 'tr>td', :text => @song1.format_length, :count => 1

    assert_select 'tr>td', :text => @song2.title, :count => 1
    assert_select 'tr>td', :text => @song2.album_title, :count => 1
    assert_select 'tr>td', :text => @song2.artist_name, :count => 1
    assert_select 'tr>td', :text => @song2.track_number.to_s, :count => 1
    assert_select 'tr>td', :text => @song2.format_length, :count => 1
  end
end
