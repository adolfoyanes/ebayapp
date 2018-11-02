class LensColorsController < ApplicationController
  before_action :set_lens_color, only: [:show, :edit, :update, :destroy]

  # GET /lens_colors
  # GET /lens_colors.json
  def index
    @lens_colors = LensColor.all
  end

  # GET /lens_colors/1
  # GET /lens_colors/1.json
  def show
  end

  # GET /lens_colors/new
  def new
    @lens_color = LensColor.new
  end

  # GET /lens_colors/1/edit
  def edit
  end

  # POST /lens_colors
  # POST /lens_colors.json
  def create
    @lens_color = LensColor.new(lens_color_params)

    respond_to do |format|
      if @lens_color.save
        format.html { redirect_to @lens_color, notice: 'Lens color was successfully created.' }
        format.json { render :show, status: :created, location: @lens_color }
      else
        format.html { render :new }
        format.json { render json: @lens_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lens_colors/1
  # PATCH/PUT /lens_colors/1.json
  def update
    respond_to do |format|
      if @lens_color.update(lens_color_params)
        format.html { redirect_to @lens_color, notice: 'Lens color was successfully updated.' }
        format.json { render :show, status: :ok, location: @lens_color }
      else
        format.html { render :edit }
        format.json { render json: @lens_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lens_colors/1
  # DELETE /lens_colors/1.json
  def destroy
    @lens_color.destroy
    respond_to do |format|
      format.html { redirect_to lens_colors_url, notice: 'Lens color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lens_color
      @lens_color = LensColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lens_color_params
      params.require(:lens_color).permit(:frame_width_id, :frame_color_id, :model_id, :name)
    end
end
