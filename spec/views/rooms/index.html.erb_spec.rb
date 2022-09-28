require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(
        name: "Name",
        description: "MyText",
        price: 2,
        max_number_of_visitors: 3
      ),
      Room.create!(
        name: "Name",
        description: "MyText",
        price: 2,
        max_number_of_visitors: 3
      )
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
