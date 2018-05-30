# frozen_string_literal: true

class FiltersController < ApplicationController
  before_action :set_filter, only: %i[show edit update destroy]

  def index
    @filters = Filter.all
  end

  def show; end

  def new
    @filter = Filter.new
  end

  def edit; end

  def create
    @filter = Filter.new(filter_params)
    respond_to do |format|
      if @filter.save
        format.html { redirect_to @filter, notice: 'Filter was successfully created.' }
        format.json { render :show, status: :created, location: @filter }
      else
        format.html { render :new }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @filter.update(filter_params)
        format.html { redirect_to @filter, notice: 'Filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @filter }
      else
        format.html { render :edit }
        format.json { render json: @filter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @filter.destroy
    respond_to do |format|
      format.html { redirect_to filters_url, notice: 'Filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_filter
    @filter = Filter.find(params[:id])
  end

  def filter_params
    params.require(:filter).permit(:name)
  end
end