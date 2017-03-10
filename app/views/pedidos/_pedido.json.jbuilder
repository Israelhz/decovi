json.extract! pedido, :id, :tipo, :estatus, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)