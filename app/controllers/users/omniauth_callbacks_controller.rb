class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
    provider = "google_oauth2"
    @auth = request.env["omniauth.auth"]
    user_info = request.env["omniauth.auth"].info
    uid       = request.env["omniauth.auth"].uid
    @token = @auth["credentials"]["token"]    
    @user     = User.find_or_create_from_provider(provider,user_info, uid)
    @user.token = @token
    @user.provider = "google"
    @user.uid = uid


    if @user.persisted?
      if @user.bio != nil
        sign_in_and_redirect @user, event: :authentication, notice: "Thanks for signing in with Google."
      else
        sign_in @user
        redirect_to after_signup_path(:setup_email)
      end
    else
      redirect_to new_user_registration_path, alert: "Sorry we had trouble signing you in with Google."
    end
    
  end  

  def linkedin
    provider = "linkedin"
    @auth = request.env["omniauth.auth"]
    user_info = request.env["omniauth.auth"].info
    Rails.logger.info("$$$$$$$$$$$$$$$$$$$$$$$$")
    Rails.logger.info(user_info)
    Rails.logger.info("$$$$$$$$$$$$$$$$$$$$$$$$")
    uid       = request.env["omniauth.auth"].uid
    @token = @auth["credentials"]["token"]    
    @user     = User.find_or_create_from_provider(provider,user_info, uid)
    @user.token = @token
    @user.provider = "linkedin"
    @user.uid = uid


    if @user.persisted?
      if @user.bio != nil
        sign_in_and_redirect @user, event: :authentication, notice: "Thanks for signing in with Linkedin."
      else
        sign_in @user
        redirect_to after_signup_path(:setup_email)
      end
    else
      redirect_to new_user_registration_path, alert: "Sorry we had trouble signing you in with Linkedin."
    end
  end

end