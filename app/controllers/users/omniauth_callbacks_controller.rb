class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
    @auth = request.env["omniauth.auth"]
    user_info = request.env["omniauth.auth"].info
    uid       = request.env["omniauth.auth"].uid
    @token = @auth["credentials"]["token"]
    
    @user     = User.find_or_create_from_google(user_info, uid)
    @user.token = @token
    @user.provider = "google"
    @user.uid = uid

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication, notice: "Thanks for signing in with Google."
    else
      redirect_to new_user_registration_path, alert: "Sorry we had trouble signing you in with Google."
    end
    
  end  

  def get_events
    @calendars = current_user.calendars.active 
    redirect_to business_calendars_path(session[:business_id])
  end

  private

  def calendar_params
    params.permit([:summary, :is_active, :time_zone, :unique_id, :business_id, :user_id])  
  end

end