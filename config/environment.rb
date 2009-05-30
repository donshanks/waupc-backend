# ENV['RAILS_ENV'] ||= 'production'
#RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.log_level = :debug
  config.action_controller.session = {
    :session_key => '_fmissions_session',
    :secret      => '5b098428a37f4cf2dd9d10d2678078629747f06436c5f311d3cc34e01d03478ffc22600464f03b547bd9c1942bf714e15e95604de26f3154c99d6d809257218e'
  }
  # config.action_controller.session_store = :active_record_store
  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
end

#ActionController::AbstractRequest.relative_url_root = "/fmissions"

gem 'mislav-will_paginate', '~> 2.2'
require 'will_paginate'
require 'auto_complete'
require 'ext/string'
require 'ext/nil'

