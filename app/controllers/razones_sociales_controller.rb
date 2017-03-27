class RazonesSocialesController < ApplicationController
  before_action :set_razones_sociale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :correct_user
  # GET /razones_sociales
  # GET /razones_sociales.json
  def index
    @razones_sociales = current_user.razones_sociales
  end

  # GET /razones_sociales/1
  # GET /razones_sociales/1.json
  def show
  end

  # GET /razones_sociales/new
  def new
    @razones_sociale = current_user.razones_sociales.build
  end

  # GET /razones_sociales/1/edit
  def edit
  end

  # POST /razones_sociales
  # POST /razones_sociales.json
  def create
    @razones_sociale = current_user.razones_sociales.build(razones_sociale_params)

    respond_to do |format|
      if @razones_sociale.save
        format.html { redirect_to @razones_sociale, notice: 'Razones sociale was successfully created.' }
        format.json { render :show, status: :created, location: @razones_sociale }
      else
        format.html { render :new }
        format.json { render json: @razones_sociale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /razones_sociales/1
  # PATCH/PUT /razones_sociales/1.json
  def update
    respond_to do |format|
      if @razones_sociale.update(razones_sociale_params)
        format.html { redirect_to @razones_sociale, notice: 'Razones sociale was successfully updated.' }
        format.json { render :show, status: :ok, location: @razones_sociale }
      else
        format.html { render :edit }
        format.json { render json: @razones_sociale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /razones_sociales/1
  # DELETE /razones_sociales/1.json
  def destroy
    @razones_sociale.destroy
    respond_to do |format|
      format.html { redirect_to razones_sociales_url, notice: 'Razones sociale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_razones_sociale
      @razones_sociale = RazonesSociale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def razones_sociale_params
      params.require(:razones_sociale).permit(:nombre, :rfc, :email, :direccion, :telefono, :notas, :user_id)
    end

    def correct_user
      if !current_user.empresa?
        redirect_to :controller => 'home', :action => 'index'
      end    
    end
end
