class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
     # redirect_to new_event_path
   
    if @user.bio != nil
      sign_in_and_redirect @user, event: :authentication, notice: "Thanks for signing in!"
    else
      sign_in @user
      redirect_to after_signup_path(:setup_email)
    end
  end  
end
