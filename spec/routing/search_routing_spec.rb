require 'rails_helper'

RSpec.describe SongsController, type: :routing do
  describe 'routing' do
    it 'routes to #search' do
      expect(:get => '/search').to route_to('search#search')
      expect(:post => '/search').to route_to('search#search')
    end
  end
end