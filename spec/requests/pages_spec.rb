require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  before do
    room1 = Room.new(id: 1, name: 'RSpec Intro', description: 'descr', short_description: 'short', price: 20,
                     created_at: DateTime.now, updated_at: DateTime.now)
    room2 = Room.new(id: 2, name: 'RSpec Intro', description: 'descr', short_description: 'short', price: 20,
                     created_at: DateTime.now, updated_at: DateTime.now)
    room3 = Room.new(id: 3, name: 'RSpec Intro', description: 'descr', short_description: 'short', price: 20,
                     created_at: DateTime.now, updated_at: DateTime.now)
    @rooms = Room.all.first(3)
    data = CurrentWeatherService.new(latitude: '59.93', longitude: '30.33', units: 'metric').call
    @weather = Weather.new(data)
  end

  describe 'GET /index' do
    it 'responses with code 200' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
