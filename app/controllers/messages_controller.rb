class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
  end
end
