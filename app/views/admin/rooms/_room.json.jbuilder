json.extract! room, :id, :name, :description, :price, :max_number_of_visitors, :created_at, :updated_at
json.url room_url(room, format: :json)
