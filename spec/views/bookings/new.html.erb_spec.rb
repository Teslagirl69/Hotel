require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      num_of_persons: 1,
      room_id: 1
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input[name=?]", "booking[num_of_persons]"

      assert_select "input[name=?]", "booking[room_id]"
    end
  end
end
