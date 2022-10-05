FactoryBot.define do
  factory :booking do
    start_date { "2022-10-02" }
    last_date { "2022-10-02" }
    num_of_persons { 1 }
    room_id { 1 }
  end
end
