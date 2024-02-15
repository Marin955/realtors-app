class RealtorsController < ApplicationController
  before_action :set_realtor, only: %i[ show edit update destroy ]

  # GET /realtors or /realtors.json
  def index
    @realtors = Realtor.paginate(page: params[:page], per_page: 20)
  end

  # GET /realtors/1 or /realtors/1.json
  def show
  end

  # GET /realtors/new
  def new
    @realtor = Realtor.new
  end

  # GET /realtors/1/edit
  def edit
  end

  # POST /realtors or /realtors.json
  def create
    @realtor = Realtor.new(realtor_params)

    respond_to do |format|
      if @realtor.save
        format.html { redirect_to realtor_url(@realtor), notice: "Realtor was successfully created." }
        format.json { render :show, status: :created, location: @realtor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realtors/1 or /realtors/1.json
  def update
    respond_to do |format|
      if @realtor.update(realtor_params)
        format.html { redirect_to realtor_url(@realtor), notice: "Realtor was successfully updated." }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realtors/1 or /realtors/1.json
  def destroy
    @realtor.destroy!

    respond_to do |format|
      format.html { redirect_to realtors_url, notice: "Realtor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realtor_params
      params.require(:realtor).permit(:first_name, :last_name, :brokerage, :zipcode, :image_url)
    end
end
