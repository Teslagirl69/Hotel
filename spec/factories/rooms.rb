FactoryBot.define do
  factory :room do
    name { "MyString" }
    description { "MyText" }
    price { 1 }
    max_number_of_visitors { 1 }
  end
end
