class RazonesSociale < ApplicationRecord
  belongs_to :user
  has_many :razones_comerciales
end
