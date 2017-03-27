class RazonesComercialesController < ApplicationController
  before_action :set_razones_comerciale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :correct_user

  # GET /razones_comerciales
  # GET /razones_comerciales.json
  def index
    @razones_sociale = RazonesSociale.find(params[:razon])
    @razones_comerciales = @razones_sociale.razones_comerciales
  end

  # GET /razones_comerciales/1
  # GET /razones_comerciales/1.json
  def show
    @razones_sociale = RazonesSociale.find(@razones_comerciale.razones_sociale_id)
  end

  # GET /razones_comerciales/new
  def new
    @razones_sociale = RazonesSociale.find(params[:razon])
    @razones_comerciale = @razones_sociale.razones_comerciales.build
  end

  # GET /razones_comerciales/1/edit
  def edit
    @razones_sociale = RazonesSociale.find(@razones_comerciale.razones_sociale_id)
  end

  # POST /razones_comerciales
  # POST /razones_comerciales.json
  def create
    @razones_sociale = RazonesSociale.find(params[:razones_comerciale][:razones_sociale_id])
    @razones_comerciale = @razones_sociale.razones_comerciales.build(razones_comerciale_params)

    respond_to do |format|
      if @razones_comerciale.save
        format.html { redirect_to @razones_comerciale, notice: 'Razones comerciale was successfully created.' }
        format.json { render :show, status: :created, location: @razones_comerciale }
      else
        format.html { render :new }
        format.json { render json: @razones_comerciale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /razones_comerciales/1
  # PATCH/PUT /razones_comerciales/1.json
  def update
    respond_to do |format|
      if @razones_comerciale.update(razones_comerciale_params)
        format.html { redirect_to @razones_comerciale, notice: 'Razones comerciale was successfully updated.' }
        format.json { render :show, status: :ok, location: @razones_comerciale }
      else
        format.html { render :edit }
        format.json { render json: @razones_comerciale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /razones_comerciales/1
  # DELETE /razones_comerciales/1.json
  def destroy
    @razones_sociale = RazonesSociale.find(@razones_comerciale.razones_sociale_id)
    @razones_comerciale.destroy
    respond_to do |format|
      format.html { redirect_to razones_comerciales_url(:razon => @razones_sociale), notice: 'Razones comerciale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_razones_comerciale
      @razones_comerciale = RazonesComerciale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def razones_comerciale_params
      params.require(:razones_comerciale).permit(:nombre, :area, :telefono1, :telefono2, :razones_sociale_id)
    end

    def correct_user
      if !current_user.empresa?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end
