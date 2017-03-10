class WorkersController < ApplicationController
	before_action :authenticate_user!, :correct_user

	def index
	    @users = User.where(trabajaPara: current_user.id)
	end

	def new
    	@user = User.new
  	end

	def add_user   
	  @user = User.new(user_params)
	   if @user.save!
   	    flash[:notice] = 'Empleado creado exitosamente'
	   else
	    flash[:notice] = 'Error en creacion de empleado'
	   end
	   redirect_to root_path
	end
	
	private
    def correct_user
      if !current_user.empresa?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end

    def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :trabajaPara, :empleado, :aprobado)
	end
end