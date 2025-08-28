class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
  end

  private

  def message_params
    param.require(:item).permit(:content)
  end
end
