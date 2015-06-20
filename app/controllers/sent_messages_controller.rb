class SentMessagesController < ApplicationController
  def index
    @messages = sender_messages
    @user = current_user
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
  end
end
