class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :recipient_messages
  helper_method :sender_messages

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?
  end

  def recipient_messages
    @recipient_messages = Message.where(recipient_id: current_user.id).all
  end

  def sender_messages
    @sender_messages = Message.where(sender_id: current_user.id).all
  end
end
