# ENV['RAILS_ENV'] ||= 'production'
#RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.log_level = :error
  config.log_path = "/opt/web/log/waupc-backend/#{RAILS_ENV}.log"
  config.action_controller.session = {
    :session_key => '_fmissions_session',
    :secret      => '5b098428a37f4cf2dd9d10d2678078629747f06436c5f311d3cc34e01d03478ffc22600464f03b547bd9c1942bf714e15e95604de26f3154c99d6d809257218e'
  }
end

gem 'mislav-will_paginate', '~> 2.2'

require 'will_paginate'
require 'auto_complete'
require 'upload_column'

require 'ext/string'
require 'ext/nil'

