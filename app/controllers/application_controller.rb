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

  def google_api_key
    domain = request.domain()
    apikey = case domain
      when 'waupci.com'then 'ABQIAAAA4QvaOZF0TyrEiBjftCedLhRo2sb7Ikqu5STjBO-1TQs3bohOxBSXU50lJn7cTpZTpihmKDZBynF4EQ'
      when 'waupc.net' then 'ABQIAAAAaodYeVLxuLcv9GzH5da9KBR0Sltk3GtkScdUDsCNtJwC2XNkwxQ7yWg1BmYNgapKdyDHAhipU5NNIQ'
      else                  'ABQIAAAA4QvaOZF0TyrEiBjftCedLhSuQ5C3NrpuFfvdIEwLzD_XE8o3LRSVdrSnnSrdVxlO0vwwpXf_lEcCJg'
    end
    apikey
  end

end
