# frozen_string_literal: true

class FiltersValuesController < ApplicationController
  before_action :set_filters_value, only: %i[show edit update destroy]

  def index
    @filters_values = FiltersValue.all
  end

  def show; end

  def new
    @filters_value = FiltersValue.new
  end

  def edit; end

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

  def destroy
    @filters_value.destroy
    respond_to do |format|
      format.html { redirect_to filters_values_url, notice: 'Filters value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_filters_value
    @filters_value = FiltersValue.find(params[:id])
  end

  def filters_value_params
    params.require(:filters_value).permit(:option)
  end
end
