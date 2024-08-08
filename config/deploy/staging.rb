# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :application, "face_auth"
set :repo_url, "git@github.com:Protonshub-Product/faceauth-be-ror.git"

server '3.134.245.72', port: 22, roles: [:web, :app, :db], primary: true
set :rbenv_ruby, '3.2.2'

set :user, 'ubuntu'
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :pty,             true
set :use_sudo,        false
set :stage,           :staging
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/face_auth_rsa) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
set :skip_webpack_compilation, true
set :branch, 'main' 

# set :default_env, {
#   path: "/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/bin/webpack"
# }

append :linked_files, "config/master.key", "config/credentials/staging.key"
#append :linked_files, "config/puma.rb"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "public/uploads"
append :linked_dirs, "node_modules"   



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
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
#set :default_env, { path: "/usr/local/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
# after 'deploy:updated', 'deploy:precompile_assets'
# namespace :deploy do
#   desc 'Precompile assets'
#   task :precompile_assets do
#     on roles(:web) do
#       within release_path do
#         execute :rake, 'assets:precompile'
#       end
#     end
#   end
# end

namespace :sidekiq do
  desc "Restart Sidekiq service"
  task :restart do
    on roles(:app) do
      execute :sudo, :service, "sidekiq_face_auth_staging", :restart
    end
  end
end

after "deploy:published", "sidekiq:restart"

