class Pedido < ApplicationRecord
	belongs_to :user
	has_many :product_orders
	has_one :factura
	has_one :razones_comerciale
end
