class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json
  def index
    if current_user.admin
      @recibidos = Pedido.where(estatus: 'Recibido')
      @aprobados = Pedido.where(estatus: 'Aprobado')
      @produccion = Pedido.where(estatus: 'Produccion')
      @enviados = Pedido.where(estatus: 'Enviado')
      @entregados = Pedido.where(estatus: 'Entregado')
    else
      @pedidos = current_user.pedidos
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @usuario = User.find(@pedido.user_id)
    if Factura.where(pedido_id: @pedido.id).exists?
      @factura = Factura.where(pedido_id: @pedido.id).first
    end
    if (@usuario.empresa? || @usuario.empleado?) && RazonesSociale.exists?(@pedido.razones_sociale_id)
      @sociales = RazonesSociale.find(@pedido.razones_sociale_id)
      @comerciales = RazonesComerciale.find(@pedido.razones_comerciale_id)
    end

    if @usuario.individuo? && DireccionesEntrega.exists?(@pedido.direcciones_entrega_id)
      @entrega = DireccionesEntrega.find(@pedido.direcciones_entrega_id)
    end

    if @usuario.individuo? && DireccionesFactura.exists?(@pedido.direcciones_factura_id)
      @direccionfactura = DireccionesFactura.find(@pedido.direcciones_factura_id)
    end
  end

  # GET /pedidos/new
  def new
    @pedido = current_user.pedidos.build
    @usuarios = User.all
    if current_user.empresa
      @razones_sociales = current_user.razones_sociales
      @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => current_user.id).pluck(:id))
    end
    if current_user.empleado
      @razones_sociales = User.find(current_user.trabajaPara).razones_sociales
      @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => current_user.trabajaPara).pluck(:id))
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
      
      if User.find(@pedido.user_id).empresa?
        @razones_sociales = User.find(@pedido.user_id).razones_sociales
        @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => @pedido.user_id).pluck(:id))
      end

      if User.find(@pedido.user_id).empleado?
          @razones_sociales = User.find(User.find(@pedido.user_id).trabajaPara).razones_sociales
          @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => User.find(@pedido.user_id).trabajaPara).pluck(:id))
      end 
      @direcciones_facturas = User.find(@pedido.user_id).direcciones_facturas
      @direcciones_entregas = User.find(@pedido.user_id).direcciones_entregas
    end
    if current_user.empresa
      @razones_sociales = current_user.razones_sociales
      @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => current_user.id).pluck(:id))
    end
    if current_user.empleado
      @razones_sociales = User.find(current_user.trabajaPara).razones_sociales
      @razones_comerciales = RazonesComerciale.where(:razones_sociale_id => RazonesSociale.where(:user_id => current_user.trabajaPara).pluck(:id))
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
        format.html { redirect_to new_product_order_path(pedido: @pedido.id), notice: 'Pedido was successfully created.' }
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

  def produccion
    Pedido.where(id: params[:pedido_id]).update_all(estatus: 'Produccion')
    redirect_to :controller => 'pedidos', :action => 'index'
  end

  def enviado
    Pedido.where(id: params[:pedido_id]).update_all(estatus: 'Enviado')
    redirect_to :controller => 'pedidos', :action => 'index'
  end

  def entregado
    Pedido.where(id: params[:pedido_id]).update_all(estatus: 'Entregado')
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
