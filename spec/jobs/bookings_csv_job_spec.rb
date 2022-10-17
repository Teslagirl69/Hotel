require 'rails_helper'

RSpec.describe BookingsCsvJob, type: :job do
  before do
    room1 = Room.create!( id: 7, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    room2 = Room.create!( id: 4, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    room1 = Room.create!( id: 2, name: "RSpec Intro", description: "descr", short_description: 'short', price: 20, created_at: DateTime.now, updated_at: DateTime.now)
    booking1 = Booking.create!( room_id: 7, id: 1, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 9.days).to_s, last_date: (Date.today + 10.days).to_s)
    booking2 = Booking.create!( room_id: 4, id: 2, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 11.days).to_s, last_date: (Date.today + 12.days).to_s)
    booking3 = Booking.create!( room_id: 2, id: 3, user_name: "RSpec Intro", user_email: "descr@g.ru", status: 0, created_at: DateTime.now, updated_at: DateTime.now, start_date: (Date.today + 13.days).to_s, last_date: (Date.today + 14.days).to_s)
    @bookings = [booking1, booking2, booking3 ]

  end
  describe '#perform_later' do
    before { ActiveJob::Base.queue_adapter = :test }

    it 'will be enqueued' do
      expect do
        BookingsCsvJob.perform_later(1)
      end.to have_enqueued_job
    end

    it 'will generate csv files' do
      BookingsCsvJob.perform_now
      expect(File.exist?('bookings.csv')).to eq(true)
          end
  end
end