class HomepageController < ApplicationController
  def index
    if user_signed_in? && (current_user.bio != nil)
      redirect_to new_event_path
    elsif user_signed_in? && (current_user.bio === nil)
      redirect_to after_signup_path(:setup_email)
    end
  end
end
