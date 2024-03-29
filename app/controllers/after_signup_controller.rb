class AfterSignupController < Wicked::WizardController
  include Wicked::Wizard

  steps :setup_email

  def show
    @user = current_user
    # EventMailer.welcome_email(@user).deliver
    # case step
    render_wizard 
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end

  private

  def finish_wizard_path
    new_event_path

  end

  def user_params
    params.require(:user).permit([:first_name, :last_name, :address, :image_url, :bio, :event_id, :avatar])
  end
end
