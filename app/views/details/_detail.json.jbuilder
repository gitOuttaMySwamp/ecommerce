json.extract! detail, :id, :description, :price, :created_at, :updated_at
json.url detail_url(detail, format: :json)
