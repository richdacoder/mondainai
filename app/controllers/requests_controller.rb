class RequestsController < ApplicationController
  def index
    @requests_received = current_user.requests_as_owner
    @requests_sent = current_user.requests
  end

  def show
    @request = Request.find(params[:id])
    @message = Message.new
  end
end
