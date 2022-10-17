require 'rails_helper'

RSpec.describe Admin::PagesController, type: :routing do
  describe 'routing' do
    it 'routes to #dashboard' do
      expect(get: '/admin/dashboard').to route_to('admin/pages#dashboard')
    end
  end
end
