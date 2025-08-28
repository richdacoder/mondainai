class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:item).permit(:content)
    @request = Request.new
    @request.show

  end
end
