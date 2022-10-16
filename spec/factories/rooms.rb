FactoryBot.define do
  factory :room do
    name { "room1" }
    description { "description" }
    short_description { "short description"}
    price { 100 }
    created_at { Time.now }
    updated_at { Time.now }
    id {1}
   end
end
