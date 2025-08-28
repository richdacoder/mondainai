class MessagesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @message = @request.messages.new(message_params)
    @message.user = current_user

  if @message.save
    redirect_to request_path(@request)
  else
    render :new
  end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
