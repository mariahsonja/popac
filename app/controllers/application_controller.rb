class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def check_if_user_has_profile!
    return if current_user.nil?
    return if current_user.profile.present?
    redirect_to new_profile_path, notice: "You must create your profile to continue."
  end
  
  def after_sign_in_path_for(resource)
    if resource.profile.present?
      profile_path(resource.profile)
    else
      new_profile_path
    end
  end
end
