require 'rails_helper'

RSpec.describe 'songs/edit', type: :view do
  before(:each) do
    @song = assign(:song, FactoryGirl.create(:song))
  end

  it 'renders the edit song form' do
    render

    assert_select 'form[action=?][method=?]', song_path(@song), 'post' do

      assert_select 'input#song_title[name=?]', 'song[title]'

      assert_select 'input#song_album_title[name=?]', 'song[album_title]'

      assert_select 'input#song_artist_name[name=?]', 'song[artist_name]'

      assert_select 'input#song_track_number[name=?]', 'song[track_number]'

      assert_select 'input#song_length[name=?]', 'song[length]'
    end
  end
end
