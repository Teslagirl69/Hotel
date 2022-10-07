class Room < ApplicationRecord
  has_many :bookings

  def self.available_rooms(start_date, last_date)
    Booking.excluded_id(start_date, last_date)
  end

end
