require 'rails_helper'

RSpec.describe Admin::FilesForBookingsController, type: :routing do
  describe 'routing' do
    it 'routes to #download' do
      expect(get: '/admin/statistic_csv.csv').to route_to('/files_for_bookings#download', format: 'csv')
    end
  end
end