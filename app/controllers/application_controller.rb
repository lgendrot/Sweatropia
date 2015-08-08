class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_last_seen_at, if: proc { user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }
  
  
  private
	  def set_last_seen_at
	  	current_user.profile.update_attribute(:last_seen_at, Time.now)
	  	session[:last_seen_at] = Time.now
	  end  


  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) << :avatar_name
	    devise_parameter_sanitizer.for(:account_update) << :avatar_name
	  end

end

