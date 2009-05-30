require 'digest/sha1'
class User < ActiveRecord::Base

	validates_length_of :login, :within => 6..100
	validates_length_of :password, :within => 5..40
	validates_presence_of :login, :password, :password_confirmation, :password_salt
	validates_uniqueness_of :login
	validates_confirmation_of :password
	validates_format_of :login, 
		:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
		:message => "Invalid login(email address)"

	attr_protected :id, :password_salt

	attr_accessor :password, :password_confirmation

	def self.random_string(len)
		chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
		newpass = ""
		1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
		return newpass
	end

	def password=(pass)
		@password=pass
		self.password_salt = User.random_string(10) if !self.password_salt?
		self.crypted_password = User.encrypt(@password,self.password_salt)
	end

	def self.encrypt(pass,salt)
		Digest::SHA1.hexdigest(pass+salt)
	end

	def self.authenticate(login,pass,req)
		u=find(:first, :conditions => ["login = ?", login])
		return nil if u.nil?
		if User.encrypt(pass,u.password_salt) == u.crypted_password
			u.login_count = (u.login_count.nil?) ? 1 : u.login_count + 1
			u.last_login_at = u.current_login_at
			u.current_login_at = Time.now
			u.last_login_ip = u.current_login_ip
			u.current_login_ip = req.remote_ip
			u.save
			return u
		end
	end

	def send_new_password
		new_pass = User.random_string(10)
		self.password = self.password_confirmation = new_pass
		self.save
		Notifications.deliver_forgot_password(self.login, self.login, new_pass)
	end
	
end
