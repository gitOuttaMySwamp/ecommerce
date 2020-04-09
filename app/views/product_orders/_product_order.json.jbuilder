json.extract! product_order, :id, :piece_id, :order_id, :created_at, :updated_at
json.url product_order_url(product_order, format: :json)
