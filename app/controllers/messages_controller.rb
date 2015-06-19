class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:body, :sender_id, :recipient_id).merge(sender_id: current_user.id))
    if @message.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
end
