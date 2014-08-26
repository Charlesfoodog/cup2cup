class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if user_signed_in? && current_user.bio === nil
     redirect_to after_signup_path 
    end
  end

  private 

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :profile_name, :email, :password, 
        :password_confirmation, :current_password, :address, :avatar, :access_token, :image_url, :bio, :provider, :is_admin )}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :profile_name, :email, :password, 
        :password_confirmation, :current_password, :address, :avatar, :access_token, :image_url, :bio, :provider, :is_admin )}
  end
end
