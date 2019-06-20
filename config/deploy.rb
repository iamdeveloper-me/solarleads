# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "solarleads"
set :repo_url, "git@github.com:iamdeveloper-me/solarleads.git"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads", "vendor/bundle"
append :linked_files, "config/database.yml", "config/master.key", "config/secrets.yml"

# set :nginx_server_name, "localhost #{fetch(:application)}.local stg.shiftmanager.visunware.com"

# set :rvm_type, :user
set :rvm_ruby_version, '2.6.1@solarleads'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# namespace :deploy do
#  task :remove_deployment_files do
#    # run "rm  /root/deploy_lp1/releases/#{latest_release}/config/credentials.yml.enc"
#    run "/root/deploy_lp1/releases/#{latest_release}/bundle exec rails credentials:edit"
#  end
# end
# after 'deploy', 'deploy:remove_deployment_files'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# after 'deploy:symlink:linked_dirs', 'deploy:remove_deployment_files'

# namespace :deploy do
#  task :remove_deployment_files do
#   on roles(:app) do
#     within release_path do
#       # run "rm /root/deploy_lp1/releases/#{latest_release}/config/credentials.yml.enc "
#       run "rm /config/credentials.yml.enc "
#       run "bundle exec rails credentials:edit "
#     end
#   end
#    # run "rm /root/deploy_lp1/releases/#{latest_release}/config/credentials.yml.enc "
#    # run "bundle exec rails credentials:edit "
#  end
# end

# after 'deploy:updated', 'deploy:create_deployment_files'

# namespace :deploy do
#  task :create_deployment_files do
#    run "EDITOR=vim bin/rails credentials:edit "
#  end
# end
