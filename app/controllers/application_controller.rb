class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def after_sign_up_path_for(resource)
  #   if user_signed_in? && current_user.bio === nil
  #    redirect_to after_signup_path 
  #   end
  # end
end
