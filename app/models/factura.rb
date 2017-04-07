class Factura < ApplicationRecord
	belongs_to :pedido
	validates :image, :presence => true
    has_attached_file :image
    validates_attachment_content_type :image,
        :content_type => /\Aimage\/.*\Z/
    validates_attachment :image, size: { in: 0..5.megabytes }
end
