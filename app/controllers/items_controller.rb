class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.paginate(page: params[:page], per_page: 5)
  end

  def things
    @items = Item.things.paginate(page: params[:page], per_page: 5)
    render action: :index
  end

  def beverages
    @items = Item.beverages.paginate(page: params[:page], per_page: 5)
    render action: :index
  end

  def boots
    @items = Item.boots.paginate(page: params[:page], per_page: 5)
    render action: :index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :name, :category_id)
    end
end