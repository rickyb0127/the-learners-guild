class ReceivedMessagesController < ApplicationController
  def index
    @message = recipient_messages.where(conversation_id: Message.uniq.pluck(:conversation_id)).last
    @total_messages = Message.all
    @user = current_user
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
    @total_messages = Message.where(conversation_id: @message.conversation_id).order("created_at")
  end
end
