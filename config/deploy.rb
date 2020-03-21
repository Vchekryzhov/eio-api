require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
# require 'mina_sidekiq/tasks'
# require 'mina/whenever'
# require 'mina/delayed_job'


set :application_name, 'eio'
set :domain, '82.179.84.219'
set :user, 'eio'
set :deploy_to, '/home/eio/eio'
set :repository, 'git@github.com:Vchekryzhov/eio-api.git'
set :branch, 'master'
set :rails_env, 'production'
set :port, 2848

task :remote_environment do
  invoke :'rbenv:load'
end

set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/master.key')
set :shared_dir, fetch(:shared_files, []).push('public/uploads', 'tmp/pids')


# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"]

  command %(mkdir -p "#{fetch(:deploy_to)}/shared/pids/")
  command %(chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/pids")

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp/pids"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/public/uploads"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/public/uploads"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/public/storage"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/public/storage"]

  command %[touch "#{fetch(:deploy_to)}/shared/config/database.yml"]
  command %[touch "#{fetch(:deploy_to)}/shared/config/master.key"]
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'
    on :launch do
      in_path(fetch(:current_path)) do
        invoke :'rbenv:load'
        # invoke :'delayed_job:restart'
        # command %(RAILS_ENV=#{fetch(:rails_env)} bundle exec pumactl -F config/puma.rb stop)
        command %(RAILS_ENV=#{fetch(:rails_env)} bundle exec pumactl -F config/puma.rb start)
      end
    end
  end
end
