json.extract! producto, :id, :nombre, :acabado, :cantidad, :created_at, :updated_at
json.url producto_url(producto, format: :json)