class FrameWidthsController < ApplicationController
  before_action :set_frame_width, only: [:show, :edit, :update, :destroy]

  # GET /frame_widths
  # GET /frame_widths.json
  def index
    @frame_widths = FrameWidth.all
  end

  # GET /frame_widths/1
  # GET /frame_widths/1.json
  def show
  end

  # GET /frame_widths/new
  def new
    @frame_width = FrameWidth.new
  end

  # GET /frame_widths/1/edit
  def edit
  end

  # POST /frame_widths
  # POST /frame_widths.json
  def create
    @frame_width = FrameWidth.new(frame_width_params)

    respond_to do |format|
      if @frame_width.save
        format.html { redirect_to @frame_width, notice: 'Frame width was successfully created.' }
        format.json { render :show, status: :created, location: @frame_width }
      else
        format.html { render :new }
        format.json { render json: @frame_width.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frame_widths/1
  # PATCH/PUT /frame_widths/1.json
  def update
    respond_to do |format|
      if @frame_width.update(frame_width_params)
        format.html { redirect_to @frame_width, notice: 'Frame width was successfully updated.' }
        format.json { render :show, status: :ok, location: @frame_width }
      else
        format.html { render :edit }
        format.json { render json: @frame_width.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frame_widths/1
  # DELETE /frame_widths/1.json
  def destroy
    @frame_width.destroy
    respond_to do |format|
      format.html { redirect_to frame_widths_url, notice: 'Frame width was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frame_width
      @frame_width = FrameWidth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frame_width_params
      params.require(:frame_width).permit(:name)
    end
end
