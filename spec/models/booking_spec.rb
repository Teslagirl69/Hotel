require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :start_date }
    it { is_expected.to validate_presence_of :last_date }
    it { is_expected.to validate_presence_of :user_name }
    it { is_expected.to validate_presence_of :user_email }
    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :status }
  end
  context 'association' do
    it { should belong_to(:room) }
   end

  it "should return error if start_date smaller than current date" do
    room = create(:room)
    booking_1 = build(:booking, start_date: (Date.today- 10.days).to_s )
    booking_1.should_not be_valid
    booking_1.errors[:start_date].should  == ["Check-in date should be greater or equal to today's date"]
  end
  it "should be valid if start_date greater than current date" do
    room = create(:room)
    booking_2 = build(:booking, start_date: (Date.today + 10.days).to_s, last_date: (Date.today + 11.days).to_s)
    booking_2.should be_valid
  end
  it "should return error if start_date greater than last_date" do
    room = create(:room)
    booking_1 = build(:booking, start_date: (Date.today).to_s, last_date: (Date.today - 10.days).to_s)
    booking_1.should_not be_valid
    booking_1.errors[:last_date].should  == ["Check-out date should be greater than Check-in date"]
  end

end
