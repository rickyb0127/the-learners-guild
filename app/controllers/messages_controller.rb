class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge(sender_id: current_user.id))
    if @message.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to received_message_path(@message)
    else
      render "received_messages#index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id, :trade_ask_skill_id, :trade_give_skill_id, :start_time, :end_time, :read)
  end
end
