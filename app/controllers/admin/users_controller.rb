class Admin::UsersController < ApplicationController
	before_filter :login_required, :only => ['welcome', 'change_password', 'hidden']

	def signup
		@user = User.new(params[:user]) 
		if request.post?
			if @user.save
				session[:user] = User.authenticate( @user.login, @user.password, request )
				flash[:message] = "Signup successful"
				redirect_to :action => "welcome"
			else
				flash[:message] = "Signup unsuccessful"
			end
		end
	end

	def login
		if request.post?
			if session[:user] = User.authenticate( 
					params[:user][:login], 
					params[:user][:password], 
					request 
				)
				flash[:message] = "Login successful"
				redirect_to_stored
			else
				flash[:message] = "Login unsuccessful"
			end
		end
	end

	def logout
		session[:user] = nil
		flash[:message] = "Logged out"
		redirect_to :action => "login"
	end

	def forgot_password
		if request.post?
			u=User.find_by_login(params[:user][:login])
			if u and u.send_new_password
				flash[:message] = "A new password has been sent by email"
				redirct_to :action => 'login'
			else
				flash[:message] = "Couldn't send password"
			end
		end
	
	end

	def change_password
		@user = session[:user]
		if request.post?
			@user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
			if @user.save
				flash[:message] = "Password Changed"
			end
		end
	end

	def welcome
	end

	def hidden
	end
end
