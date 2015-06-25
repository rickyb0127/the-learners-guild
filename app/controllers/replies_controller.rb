class RepliesController < ApplicationController
  def new
    @user = current_user
    @message = Message.new
  end
end
