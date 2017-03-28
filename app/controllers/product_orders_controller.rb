class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /product_orders
  # GET /product_orders.json
  def index
    @pedido = Pedido.find(params[:pedido])
    @product_orders = @pedido.product_orders
  end

  # GET /product_orders/1
  # GET /product_orders/1.json
  def show
    @pedido = Pedido.find(@product_order.pedido_id)
  end

  # GET /product_orders/new
  def new
    @pedido = Pedido.find(params[:pedido])
    @product_order = @pedido.product_orders.build
    @productos = Producto.all
  end

  # GET /product_orders/1/edit
  def edit
    @pedido = Pedido.find(@product_order.pedido_id)
    @productos = Producto.all
  end

  # POST /product_orders
  # POST /product_orders.json
  def create
    @pedido = Pedido.find(params[:product_order][:pedido_id])
    @product_order = @pedido.product_orders.build(product_order_params)
    respond_to do |format|
      if @product_order.save
        format.html { redirect_to @product_order, notice: 'Product order was successfully created.' }
        format.json { render :show, status: :created, location: @product_order }
      else
        format.html { render :new }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_orders/1
  # PATCH/PUT /product_orders/1.json
  def update
    respond_to do |format|
      if @product_order.update(product_order_params)
        format.html { redirect_to @product_order, notice: 'Product order was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_order }
      else
        format.html { render :edit }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_orders/1
  # DELETE /product_orders/1.json
  def destroy
    @pedido = Pedido.find(@product_order.pedido_id)
    @product_order.destroy
    respond_to do |format|
      format.html { redirect_to product_orders_url(:pedido => @pedido), notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_order
      @product_order = ProductOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_order_params
      params.require(:product_order).permit(:cantidad, :producto_id, :pedido_id)
    end
end
