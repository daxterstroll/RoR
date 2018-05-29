class FiltersValuesController < ApplicationController
  before_action :set_filters_value, only: [:show, :edit, :update, :destroy]

  # GET /filters_values
  # GET /filters_values.json
  def index
    @filters_values = FiltersValue.all
  end

  # GET /filters_values/1
  # GET /filters_values/1.json
  def show
  end

  # GET /filters_values/new
  def new
    @filters_value = FiltersValue.new
  end

  # GET /filters_values/1/edit
  def edit
  end

  # POST /filters_values
  # POST /filters_values.json
  def create
    @filters_value = FiltersValue.new(filters_value_params)

    respond_to do |format|
      if @filters_value.save
        format.html { redirect_to @filters_value, notice: 'Filters value was successfully created.' }
        format.json { render :show, status: :created, location: @filters_value }
      else
        format.html { render :new }
        format.json { render json: @filters_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filters_values/1
  # PATCH/PUT /filters_values/1.json
  def update
    respond_to do |format|
      if @filters_value.update(filters_value_params)
        format.html { redirect_to @filters_value, notice: 'Filters value was successfully updated.' }
        format.json { render :show, status: :ok, location: @filters_value }
      else
        format.html { render :edit }
        format.json { render json: @filters_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filters_values/1
  # DELETE /filters_values/1.json
  def destroy
    @filters_value.destroy
    respond_to do |format|
      format.html { redirect_to filters_values_url, notice: 'Filters value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filters_value
      @filters_value = FiltersValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filters_value_params
      params.require(:filters_value).permit(:option)
    end
end
