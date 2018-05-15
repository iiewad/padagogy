# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "padagogy_staging"
set :repo_url, "git@github.com:iiewad/padagogy.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, :master

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/www/padagogy_staging"

set :user, "deployer"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :linked_files, fetch(:linked_files, []).push('config/application.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_conf, "#{shared_path}/config/puma.rb"

set :rvm_binary, '~/.rvm/bin/rvm'
set :rvm_ruby_version, 'default'

namespace :deploy do
  desc 'Restart the application'
  task :restart do
    on roles(:app) do
      execute "cd #{deploy_to}/current && #{fetch(:rvm_binary)} #{fetch(:rvm_ruby_version)} do bundle exec pumactl -S #{shared_path}/tmp/pids/puma.state restart"
    end
  end

  desc 'Uplodad config file'
  task :upload_config do
    on roles(:app) do
      upload! StringIO.new(File.read('config/application.yml')), "#{shared_path}/config/application.yml"
    end
  end
end

# after 'deploy', 'deploy:restart'

