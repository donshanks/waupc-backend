class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	  t.string  :login,            :null => false
	  t.string  :crypted_password, :null => false
	  t.string  :password_salt,    :null => false
	  t.integer :login_count
	  t.datetime :last_request
	  t.datetime :last_login_at
	  t.datetime :current_login_at
	  t.string  :last_login_ip
	  t.string  :current_login_ip
    end
  end

  def self.down
    drop_table :users
  end
end
