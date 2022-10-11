class Booking < ApplicationRecord
  enum status: { pended: 0, accepted: 1 }
  belongs_to :room
  validates :start_date, :last_date, presence: true
  before_validation :dates_is_blank
  before_validation :rooms_are_available
  validate :date_restrictions

  def date_restrictions
      if Date.today > start_date
        errors.add("Check-in date should be greater or equal to today's date")
      elsif Date.today + 6.months < last_date.to_date
       errors.add('Check-out date should be smaller than 6 months')
      elsif last_date.to_date < start_date.to_date
       errors.add('Check-out date should be greater than Check-in date')
     end
  end

  # get the all the room_id which room are booked in between start_date and last_date
  def self.excluded_id(start_date, last_date)
    # if array is empty return true else return the array
    if (@book_room = Booking.where('Date(start_date) < ? AND Date(last_date) > ? ', last_date, start_date).map(&:room_id)).empty?
      return []
    else
      return @book_room
    end
  end

  def rooms_are_available
    @booked_rooms = Room.available_rooms(start_date, last_date)

    if @booked_rooms.empty?
      return true
      else
      @booked_rooms.include?(self.room_id)
      errors.add("This room is not available on the selected dates.")
    end
  end

  def dates_is_blank
    if start_date.blank? || last_date.blank?
     errors.add("Dates are blank")
    end
  end
end
