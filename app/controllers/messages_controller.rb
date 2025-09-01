class MessagesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @message = @request.messages.new(message_params)
    @message.user = current_user
    request__user_language = @request.user.preferred_language
    item_user_language = @request.item.user.preferred_language


    if @message.valid? && request__user_language != @item_user_languag

      @translated_language = @message.user == @request.user ? item_user_language : request__user_language
      prompt = "Translate this #{@message.content} from #{@message.user.preferred_language} to #{@translated_language}"
    end

    if @message.save
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
