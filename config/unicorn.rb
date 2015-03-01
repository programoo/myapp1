rails_env = ENV['RAILS_ENV'] || 'production'

app_path  =     "/var/www/deployer/current/"

worker_processes (rails_env == 'production' ? 4 : 1)
preload_app        true
timeout            60
working_directory  app_path
pid                "#{app_path}/tmp/pids/unicorn.pid"
listen             "#{app_path}/tmp/sockets/unicorn.sock", :backlog => 64

stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

GC.respond_to?(:copy_on_write_friendly=) and
GC.copy_on_write_friendly = true

check_client_connection false