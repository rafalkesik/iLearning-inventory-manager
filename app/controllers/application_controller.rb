class ApplicationController < ActionController::Base
  def authenticate_user
    return if current_user
    redirect_to new_user_session_path, alert: "Log in to continue", status: :see_other
  end
end
