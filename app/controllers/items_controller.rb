class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @request = Request.new
  end
  def new
    @item = Item.new
  end

    def create
      @item = Item.new(item_params)
      @item.user = current_user
      if @item.save
        redirect_to items_path(@item),  notice: "Item was successfully created!"
      else
        render :new, status: :unprocessable_entity
      end
    end

      private

  def item_params
    params.require(:item).permit(:name, :description, :photo, :status, :available_date, :deadline_date, :dimensions, :weight)
  end
end
