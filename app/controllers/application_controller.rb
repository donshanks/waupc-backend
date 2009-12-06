require 'uri'

class ApplicationController < ActionController::Base
  helper :all
  filter_parameter_logging "password", "password_confirmation"
  protect_from_forgery # :secret => '42c1be565211bbdc54d4a392ae1082c1'

  def login_required
  	if session[:user]
		return true
	end
	flash[:warning] = "Please login to continue"
	session[:return_to] = request.request_uri
	redirect_to :controller => "users", :action => "login"
	return false
  end

  def current_user
  	session[:user]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
		session[:return_to] = nil
		redirect_to return_to
	else
		redirect_to :controller => "users", :action => "welcome"
	end
  end

end
