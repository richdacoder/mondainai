class MessagesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @message = @request.messages.new(message_params)
    @message.user = current_user
    request_user_language = @request.user.preferred_language
    item_user_language = @request.item.user.preferred_language


    if @message.valid? && request_user_language != item_user_language

      @translated_language = @message.user == @request.user ? item_user_language : request_user_language

      chat = RubyLLM.chat
      prompt = " You are translator specialized in real time translation

      I speak #{@message.user.preferred_language} and i do not understand #{@translated_language}. I am writing a message.

      Translate this #{@message.content} from #{@message.user.preferred_language} to #{@translated_language}

      Return an accurate translated text of only the #{@translated_language}"
      response = chat.ask(prompt)

      @message.translated_content = response.content
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
