class ProductosEspecialesController < ApplicationController
  before_action :set_productos_especiale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /productos_especiales
  # GET /productos_especiales.json
  def index
    if current_user.admin
      @productos_especiales = ProductosEspeciale.all
    else
      @productos_especiales = current_user.productos_especiales
    end
  end

  # GET /productos_especiales/1
  # GET /productos_especiales/1.json
  def show
  end

  # GET /productos_especiales/new
  def new
    @productos_especiale = current_user.productos_especiales.build
  end

  # GET /productos_especiales/1/edit
  def edit
    if current_user.admin
      @productos_especiales = ProductosEspeciale.all
    else
      @productos_especiales = current_user.productos_especiales
    end
  end

  # POST /productos_especiales
  # POST /productos_especiales.json
  def create
    @productos_especiale = current_user.productos_especiales.build(productos_especiale_params)

    respond_to do |format|
      if @productos_especiale.save
        format.html { redirect_to @productos_especiale, notice: 'Productos especiale was successfully created.' }
        format.json { render :show, status: :created, location: @productos_especiale }
      else
        format.html { render :new }
        format.json { render json: @productos_especiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos_especiales/1
  # PATCH/PUT /productos_especiales/1.json
  def update
    respond_to do |format|
      if @productos_especiale.update(productos_especiale_params)
        format.html { redirect_to @productos_especiale, notice: 'Productos especiale was successfully updated.' }
        format.json { render :show, status: :ok, location: @productos_especiale }
      else
        format.html { render :edit }
        format.json { render json: @productos_especiale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos_especiales/1
  # DELETE /productos_especiales/1.json
  def destroy
    @productos_especiale.destroy
    respond_to do |format|
      format.html { redirect_to productos_especiales_url, notice: 'Productos especiale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aprobar
    ProductosEspeciale.where(id: params[:productos_especiale_id]).update_all(aprobado: 'true')
    redirect_to :controller => 'productos_especiales', :action => 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productos_especiale
      @productos_especiale = ProductosEspeciale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productos_especiale_params
      params.require(:productos_especiale).permit(:nombre, :acabado, :aprobado, :user_id)
    end
end
