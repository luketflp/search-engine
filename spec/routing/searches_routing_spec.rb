# spec/routing/searches_routing_spec.rb

require 'rails_helper'

RSpec.describe 'Searches routing', type: :routing do
  describe 'GET /searches' do
    it 'routes to searches#index' do
      expect(get: '/searches').to route_to('searches#index')
    end
  end

  # Add more route tests as needed for other routes in your application
end
