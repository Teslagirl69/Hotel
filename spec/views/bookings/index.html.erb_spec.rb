require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        num_of_persons: 2,
        room_id: 3
      ),
      Booking.create!(
        num_of_persons: 2,
        room_id: 3
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
