require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, FactoryGirl.create(:song))
  end

  it 'renders new song form' do
    render

    assert_select 'form[action=?][method=?]', songs_path, 'post' do

      assert_select 'input#song_title[name=?]', 'song[title]'

      assert_select 'input#song_album_title[name=?]', 'song[album_title]'

      assert_select 'input#song_length[name=?]', 'song[length]'
    end
  end
end
