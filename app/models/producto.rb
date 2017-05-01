class Producto < ApplicationRecord
	validates :image, :presence => true
	has_attached_file :image
    # has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
    validates_attachment_content_type :image,
        :content_type => /\Aimage\/.*\Z/
    validates_attachment :image, size: { in: 0..5.megabytes }
end
