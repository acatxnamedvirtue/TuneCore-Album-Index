require 'rails_helper'

RSpec.describe 'artists/index', type: :view do
  before(:each) do
    @artist1, @artist2 = FactoryGirl.create(:artist), FactoryGirl.create(:artist)
    assign(:artists, [@artist1, @artist2])
  end

  it 'renders a list of artists' do
    render
    assert_select 'tr>td', :text => @artist1.name, :count => 2
  end
end
