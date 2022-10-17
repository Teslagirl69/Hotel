FactoryBot.define do
  factory :booking do
    start_date { '2022-12-02' }
    last_date { '2022-12-22' }
    room_id { 1 }
    created_at { Time.now }
    updated_at { Time.now }
    user_name { 'User' }
    user_email { 'email@mail.ru' }
    status { 0 }
  end
end
