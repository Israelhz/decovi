json.extract! product_order, :id, :cantidad, :producto_id, :pedido_id, :created_at, :updated_at
json.url product_order_url(product_order, format: :json)