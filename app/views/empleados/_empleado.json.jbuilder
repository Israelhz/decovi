json.extract! empleado, :id, :nombre, :apellidoM, :apellidoP, :correo, :password, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
