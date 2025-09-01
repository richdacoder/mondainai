class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_id
  helper_method :get_user_id
  def get_user_id
    session[:current_user_id].to_i
  end

  def set_user_id
    if user_signed_in?
      session[:current_user_id] ||= current_user.id
    end
  end
end
