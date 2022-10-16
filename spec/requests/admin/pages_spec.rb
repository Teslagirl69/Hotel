require 'rails_helper'

RSpec.describe "Pages", type: :request do
  before do
    room1 = Room.create!( id: 7, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    room2 = Room.create!( id: 4, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    room1 = Room.create!( id: 2, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    booking1 = Booking.create!( room_id: 7, id: 1, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 9.days).to_s, last_date: (Date.today + 10.days).to_s)
    booking2 = Booking.create!( room_id: 4, id: 2, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 11.days).to_s, last_date: (Date.today + 12.days).to_s)
    booking3 = Booking.create!( room_id: 2, id: 3, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 13.days).to_s, last_date: (Date.today + 14.days).to_s)

    admin = Admin.create!(email: "test@test.ru", password: '1234567')
    sign_in admin
  end
  describe "GET admin/dashboard" do
        it 'responses with code 200' do
        get admin_dashboard_url
        expect(response).to have_http_status(200)
  end
  end
end
