class ProductOrder < ApplicationRecord
	belongs_to :pedido
	has_one :producto
end
