json.extract! factura, :id, :folio, :user_id, :created_at, :updated_at
json.url factura_url(factura, format: :json)