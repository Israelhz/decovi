class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :new, :update, :destroy, :create]

  # GET /productos
  # GET /productos.json
  def index
    #@pedido = Pedido.find(params[:pedido])
    #@productos = @pedido.productos
    @productos = Producto.all
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    #@pedido = Pedido.find(@producto.pedido_id)
  end

  # GET /productos/new
  def new
    #@pedido = Pedido.find(params[:pedido])
    #@producto = @pedido.productos.build
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
    #@pedido = Pedido.find(@producto.pedido_id)
  end

  # POST /productos
  # POST /productos.json
  def create
    #@pedido = Pedido.find(params[:producto][:pedido_id])
    #@producto = @pedido.productos.build(producto_params)
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    #@pedido = Pedido.find(@producto.pedido_id)
    @producto.destroy
    respond_to do |format|
      #format.html { redirect_to productos_url(:pedido => @pedido), notice: 'Producto was successfully destroyed.' }
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:nombre, :acabado)
    end

    def correct_user
      if !current_user.admin?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end
