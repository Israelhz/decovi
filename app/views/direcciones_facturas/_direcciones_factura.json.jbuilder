json.extract! direcciones_factura, :id, :estado, :municipio, :colonia, :numero, :cp, :rfc, :notas, :user_id, :created_at, :updated_at
json.url direcciones_factura_url(direcciones_factura, format: :json)