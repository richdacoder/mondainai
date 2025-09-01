class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params[:query].present?
      @items = @items.where(name: params[:query])
    end
  end
  def show
    @item = Item.find(params[:id])
    @request = Request.new
  end
  def new
    @item = Item.new

  end

  def generate_description
    @item = Item.new(item_params)
    prompt = @item.build_prompt
    chat = RubyLLM.chat
    response = chat.ask(prompt, with: item_params[:photo].tempfile.path)
    puts response.content
    render json: { generatedDescription: response.content }
    #get name and image file from parameters
    #send name and image with prompt to LLM
    #Receive answer from LLM with generated description

  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item), notice: "Item was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :photo, :status, :available_date, :deadline_date, :dimensions, :weight)
  end
end
