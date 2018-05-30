# frozen_string_literal: true

class CategoryFieldsController < ApplicationController
  before_action :set_category_field, only: %i[show edit update destroy]

  def index
    @category_fields = CategoryField.all
  end

  def new
    @category_field = CategoryField.new
  end

  def edit; end

  def show; end

  def create
    @category_field = CategoryField.new(category_field_params)
    respond_to do |format|
      if @category_field.save
        format.html { redirect_to @category_field, notice: 'Category field was successfully created.' }
        format.json { render :show, status: :created, location: @category_field }
      else
        format.html { render :new }
        format.json { render json: @category_field.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category_field.update(category_field_params)
        format.html { redirect_to @category_field, notice: 'Category field was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_field }
      else
        format.html { render :edit }
        format.json { render json: @category_field.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category_field.destroy
    respond_to do |format|
      format.html { redirect_to category_fields_url, notice: 'Category field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category_field
    @category_field = CategoryField.find(params[:id])
  end

  def category_field_params
    params.require(:category_field).permit(:filter, :value, :category_id)
  end
end