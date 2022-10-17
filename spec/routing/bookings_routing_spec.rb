require "rails_helper"

RSpec.describe BookingsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(get: "/rooms/2/bookings/new").to route_to("bookings#new", room_id: "2")
    end

    it "routes to #show" do
      expect(get: "/rooms/2/bookings/1").to route_to("bookings#show", id: "1", room_id: "2")
    end


    it "routes to #create" do
      expect(post: "/rooms/2//bookings").to route_to("bookings#create", room_id: "2")
    end


  end
end
