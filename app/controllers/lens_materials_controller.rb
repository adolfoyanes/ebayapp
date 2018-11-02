class LensMaterialsController < ApplicationController
  before_action :set_lens_material, only: [:show, :edit, :update, :destroy]

  # GET /lens_materials
  # GET /lens_materials.json
  def index
    @lens_materials = LensMaterial.all
  end

  # GET /lens_materials/1
  # GET /lens_materials/1.json
  def show
  end

  # GET /lens_materials/new
  def new
    @lens_material = LensMaterial.new
  end

  # GET /lens_materials/1/edit
  def edit
  end

  # POST /lens_materials
  # POST /lens_materials.json
  def create
    @lens_material = LensMaterial.new(lens_material_params)

    respond_to do |format|
      if @lens_material.save
        format.html { redirect_to @lens_material, notice: 'Lens material was successfully created.' }
        format.json { render :show, status: :created, location: @lens_material }
      else
        format.html { render :new }
        format.json { render json: @lens_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lens_materials/1
  # PATCH/PUT /lens_materials/1.json
  def update
    respond_to do |format|
      if @lens_material.update(lens_material_params)
        format.html { redirect_to @lens_material, notice: 'Lens material was successfully updated.' }
        format.json { render :show, status: :ok, location: @lens_material }
      else
        format.html { render :edit }
        format.json { render json: @lens_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lens_materials/1
  # DELETE /lens_materials/1.json
  def destroy
    @lens_material.destroy
    respond_to do |format|
      format.html { redirect_to lens_materials_url, notice: 'Lens material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lens_material
      @lens_material = LensMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lens_material_params
      params.require(:lens_material).permit(:frame_width_id, :frame_color_id, :model_id, :lens_color_id, :name)
    end
end
