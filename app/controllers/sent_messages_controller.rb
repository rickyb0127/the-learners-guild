class SentMessagesController < ApplicationController
  def index
    @user = current_user
    @messages = Message.where(sender_id: @user.id).all
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
  end
end
