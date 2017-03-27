class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pedidos
  has_many :direcciones_entregas
  has_many :direcciones_facturas
  def active_for_authentication? 
    super && aprobado? 
  end 

  def inactive_message 
    if !aprobado? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
