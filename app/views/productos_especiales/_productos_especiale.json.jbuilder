json.extract! productos_especiale, :id, :nombre, :acabado, :aprobado, :user_id, :created_at, :updated_at
json.url productos_especiale_url(productos_especiale, format: :json)