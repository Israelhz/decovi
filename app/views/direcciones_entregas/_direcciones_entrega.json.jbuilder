json.extract! direcciones_entrega, :id, :estado, :municipio, :colonia, :numero, :cp, :telefono, :notas, :user_id, :created_at, :updated_at
json.url direcciones_entrega_url(direcciones_entrega, format: :json)