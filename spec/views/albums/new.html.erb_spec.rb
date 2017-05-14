require 'rails_helper'

RSpec.describe 'albums/new', type: :view do
  before(:each) {assign(:album, FactoryGirl.create(:album))}

  it 'renders new album form' do
    render

    assert_select 'form[action=?][method=?]', albums_path, 'post' do

      assert_select 'input#album_title[name=?]', 'album[title]'

      assert_select 'input#album_artist_id[name=?]', 'album[artist_id]'

      assert_select 'input#album_year[name=?]', 'album[year]'

      assert_select 'input#album_genre[name=?]', 'album[genre]'
    end
  end
end
