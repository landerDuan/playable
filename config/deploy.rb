$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
ssh_options[:forward_agent] = true

set :application, "playable_website"
set :rvm_ruby_string, "1.9.3@#{application}"
set :rvm_path, "/home/playable/.rvm"
set :rvm_bin_path, "/home/playable/.rvm/bin"
set :rvm_trust_rvmrcs_flag, 1

set :scm, :git
set :repository, "git@github.com:landerDuan/playable.git"
set :branch, "master"

set :deploy_to, "/home/playable/apps/#{application}"
set :user, "playable"
set :use_sudo, false
server "106.187.52.21", :app, :web, :db, :primary => true
set :deploy_via, :copy

set :keep_releases, 3

task :configure, :roles => :web do
  run "ln -s #{shared_path}/config/database.yml #{current_release}/config/database.yml"
  
  run "cd #{current_release}; bundle install --without development test"
end

task :trust_rvmrc, :roles => :web do
  run "rvm rvmrc trust #{current_release}"
end

task :precompile, :roles => :web do
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update_code", :trust_rvmrc
after 'deploy:update_code', :configure
after "deploy:update_code", :precompile
after 'deploy:restart',     'deploy:cleanup'