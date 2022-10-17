require 'rails_helper'

RSpec.describe Admin::PdfForBookingsController, type: :routing do
  describe 'routing' do
    it 'routes to #download' do
      expect(get: 'admin/statistic_pdf.pdf').to route_to('pdf_for_bookings#download', format: 'pdf')
    end
  end
end