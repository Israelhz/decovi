class DireccionesFacturasController < ApplicationController
  before_action :set_direcciones_factura, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :correct_user
  # GET /direcciones_facturas
  # GET /direcciones_facturas.json
  def index
    @direcciones_facturas = current_user.direcciones_facturas
  end

  # GET /direcciones_facturas/1
  # GET /direcciones_facturas/1.json
  def show
  end

  # GET /direcciones_facturas/new
  def new
    @direcciones_factura = current_user.direcciones_facturas.build
  end

  # GET /direcciones_facturas/1/edit
  def edit
  end

  # POST /direcciones_facturas
  # POST /direcciones_facturas.json
  def create
    @direcciones_factura = current_user.direcciones_facturas.build(direcciones_factura_params)

    respond_to do |format|
      if @direcciones_factura.save
        format.html { redirect_to @direcciones_factura, notice: 'Direcciones factura was successfully created.' }
        format.json { render :show, status: :created, location: @direcciones_factura }
      else
        format.html { render :new }
        format.json { render json: @direcciones_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direcciones_facturas/1
  # PATCH/PUT /direcciones_facturas/1.json
  def update
    respond_to do |format|
      if @direcciones_factura.update(direcciones_factura_params)
        format.html { redirect_to @direcciones_factura, notice: 'Direcciones factura was successfully updated.' }
        format.json { render :show, status: :ok, location: @direcciones_factura }
      else
        format.html { render :edit }
        format.json { render json: @direcciones_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direcciones_facturas/1
  # DELETE /direcciones_facturas/1.json
  def destroy
    @direcciones_factura.destroy
    respond_to do |format|
      format.html { redirect_to direcciones_facturas_url, notice: 'Direcciones factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direcciones_factura
      @direcciones_factura = DireccionesFactura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direcciones_factura_params
      params.require(:direcciones_factura).permit(:estado, :municipio, :colonia, :numero, :cp, :rfc, :notas, :user_id)
    end

    def correct_user
      if !current_user.individuo?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end
