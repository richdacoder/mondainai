class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_id
  helper_method :get_user_id
  before_action :configure_permitted_parameters, if: :devise_controller?

  def get_user_id
    session[:current_user_id].to_i
  end

  def set_user_id
    if user_signed_in?
      session[:current_user_id] ||= current_user.id
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_picture, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_picture, :address])
  end
end
