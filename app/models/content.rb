class Content < ApplicationRecord
	validates :title, :presence => true
	validates :body, :presence => true
	has_attached_file :image
    validates_attachment_content_type :image,
        :content_type => /\Aimage\/.*\Z/
    validates_attachment :image, size: { in: 0..5.megabytes }
end
