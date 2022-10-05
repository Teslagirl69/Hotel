class Booking < ApplicationRecord
  enum status: { pended: 0, accepted: 1 }
  belongs_to :room
  before_validation :rooms_are_available
  validate :date_restrictions
  validates :start_date, :last_date, presence: true
  validates_format_of :start_date, :last_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "Date must be in the following format: mm/dd/yyyy"


  def date_restrictions
    if dates_is_blank?
      return true
    elsif Date.today > start_date.to_date
      errors.add(:start_date, "check in date should be greater or equal to today's date")
      # last_date should be smaller than 6 months
    elsif Date.today + 6.months < last_date.to_date
      errors.add(:last_date, "Check out date should be smaller than 6 months")
      # last_date should be greater than start_date
    elsif last_date.to_date < start_date.to_date
      errors.add(:last_date, "check out date should be greater than Check in Date")
    end
  end

  # get the all the room_id which room are booked in between start_date and last_date
  def self.excluded_id(start_date,last_date)
    # if array is empty return  true else return the array
    if (b= Booking.where("Date(start_date) < ? AND Date(last_date) > ? ", last_date,start_date).collect(&:room_id)).empty?
      return false
    else
      return b
    end
  end

  def rooms_are_available
    if dates_is_blank?
     true
      # last_date should be smaller than 6 months
    elsif (rooms = Room.available_rooms(start_date, last_date))
      self.room_id = rooms.first.id
    elsif
    errors.add(:num_of_user, "Rooms are not available")
    end
  end

  def dates_is_blank?
    if start_date.blank? || last_date.blank?
      return true
    end
  end
end
