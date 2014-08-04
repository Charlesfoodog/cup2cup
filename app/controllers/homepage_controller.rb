class HomepageController < ApplicationController
  def index
    if user_signed_in?
      redirect_to new_event_path
    end
  end
end
