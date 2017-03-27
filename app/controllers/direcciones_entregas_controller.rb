class DireccionesEntregasController < ApplicationController
  before_action :set_direcciones_entrega, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :correct_user
  # GET /direcciones_entregas
  # GET /direcciones_entregas.json
  def index
    @direcciones_entregas = current_user.direcciones_entregas
  end

  # GET /direcciones_entregas/1
  # GET /direcciones_entregas/1.json
  def show
  end

  # GET /direcciones_entregas/new
  def new
    @direcciones_entrega = current_user.direcciones_entregas.build
  end

  # GET /direcciones_entregas/1/edit
  def edit
  end

  # POST /direcciones_entregas
  # POST /direcciones_entregas.json
  def create
    @direcciones_entrega = current_user.direcciones_entregas.build(direcciones_entrega_params)

    respond_to do |format|
      if @direcciones_entrega.save
        format.html { redirect_to @direcciones_entrega, notice: 'Direcciones entrega was successfully created.' }
        format.json { render :show, status: :created, location: @direcciones_entrega }
      else
        format.html { render :new }
        format.json { render json: @direcciones_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direcciones_entregas/1
  # PATCH/PUT /direcciones_entregas/1.json
  def update
    respond_to do |format|
      if @direcciones_entrega.update(direcciones_entrega_params)
        format.html { redirect_to @direcciones_entrega, notice: 'Direcciones entrega was successfully updated.' }
        format.json { render :show, status: :ok, location: @direcciones_entrega }
      else
        format.html { render :edit }
        format.json { render json: @direcciones_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direcciones_entregas/1
  # DELETE /direcciones_entregas/1.json
  def destroy
    @direcciones_entrega.destroy
    respond_to do |format|
      format.html { redirect_to direcciones_entregas_url, notice: 'Direcciones entrega was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direcciones_entrega
      @direcciones_entrega = DireccionesEntrega.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direcciones_entrega_params
      params.require(:direcciones_entrega).permit(:estado, :municipio, :colonia, :numero, :cp, :telefono, :notas, :user_id)
    end


    def correct_user
      if !current_user.individuo?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end
