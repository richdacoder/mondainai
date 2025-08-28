class RequestsController < ApplicationController
  def index
    @requests = Request.all
    # @item = Request.find(params[:id]).item
  end

  def show
    @request = Request.find(params[:id])
  end
end
