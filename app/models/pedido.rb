class Pedido < ApplicationRecord
	belongs_to :user
	has_many :productos
end