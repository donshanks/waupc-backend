rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes 2
listen '/tmp/waupc.sock'

preload_app true

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

stderr_path "/web/log/waupc-backend/unicorn.stderr.log"
stdout_path "/web/log/waupc-backend/unicorn.stdout.log"

before_fork do |server,worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server,worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
