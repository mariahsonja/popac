class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def check_if_user_has_profile!
    return unless current_user
    return if current_user.profile
    redirect_to new_profile_path, notice: "You must create your profile to continue."
  end
end
