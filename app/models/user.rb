class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
