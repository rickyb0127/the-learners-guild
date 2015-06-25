class MessagesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end

  def create
    conversation = Conversation.find_by(id: params["message"]["conversation_id"])
    if conversation
      @message = Message.new(message_params.merge(sender_id: current_user.id, conversation_id: conversation.id))
    else
      conversation = Conversation.create!(id: params["message"]["conversation_id"])
      @message = Message.new(message_params.merge(sender_id: current_user.id, conversation_id: conversation.id))
    end

    if @message.save(message_params)
      flash[:notice] = "Message was successfully sent"
      respond_to do |format|
        format.html {redirect_to user_path(@message.sender_id)}
        format.js {render :js => "window.location ='/users/' + '#{@message.sender_id}'"}
      end
    else
      redirect_to user_path(@user)
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
    params.require(:message).permit(:body, :sender_id, :recipient_id, :trade_ask_skill_id, :trade_give_skill_id, :start_time, :duration, :read, :conversation_id)
  end
end
