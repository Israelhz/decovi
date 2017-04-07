class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = current_user.pedidos
    @pedidosAll = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = current_user.pedidos.build
    @usuarios = User.all
    if current_user.empresa
      @razones_sociales = current_user.razones_sociales
      @razones_comerciales = RazonesComerciale.all
    end
    if current_user.individuo
      @direcciones_facturas = current_user.direcciones_facturas
      @direcciones_entregas = current_user.direcciones_entregas
    end
  end

  # GET /pedidos/1/edit
  def edit
    if current_user.admin
      @usuarios = User.all
      @razones_sociales = User.find(@pedido.user_id).razones_sociales
      @razones_comerciales = RazonesComerciale.all
      @direcciones_facturas = User.find(@pedido.user_id).direcciones_facturas
      @direcciones_entregas = User.find(@pedido.user_id).direcciones_entregas
    end
    if current_user.empresa
      @razones_sociales = current_user.razones_sociales
      @razones_comerciales = RazonesComerciale.all
    end
    if current_user.individuo
      @direcciones_facturas = current_user.direcciones_facturas
      @direcciones_entregas = current_user.direcciones_entregas
    end
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    
    if current_user.admin  
      @usuario = User.find(params[:pedido][:user_id])
      @pedido = @usuario.pedidos.build(pedido_params)
    else
      @pedido = current_user.pedidos.build(pedido_params)
    end
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aprobar
    Pedido.where(id: params[:pedido_id]).update_all(estatus: 'Aprobado')
    redirect_to :controller => 'pedidos', :action => 'index'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:tipo, :estatus, :razones_sociale_id, :razones_comerciale_id, :direcciones_entrega_id, :direcciones_factura_id)
    end
end
