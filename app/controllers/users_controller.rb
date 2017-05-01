class UsersController < ApplicationController
	before_action :authenticate_user!, :correct_user

	def index
	    @newUsersIndividuo = User.where(aprobado: false, individuo: true)
	    @usersIndividuo = User.where(aprobado: true, individuo: true)
	    @newUsersEmpresa = User.where(aprobado: false, empresa: true)
	    @usersEmpresa = User.where(aprobado: true, empresa: true)
	    @empleados = User.where(empleado: true)
	end

	def aprobar
		@aprobarUsuario = User.where(id: params[:user_id]).update_all(aprobado: true)
		redirect_to :controller => 'users', :action => 'index'
	end

	def empresa
		User.where(id: params[:user_id]).update_all(empresa: true, individuo: false)
		redirect_to :controller => 'users', :action => 'index'
	end
	
	private
    def correct_user
      if !current_user.admin?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end