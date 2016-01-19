# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'manager'
set :repo_url, 'git@github.com:tonybruess/slack-ops-manager.git'
set :deploy_to, '/usr/share/nginx'

# some servers require password login, ask for the password
ask(:password, 'root', echo: false)

# install dependencies
before "deploy:starting", "git:install"
before "deploy:starting", "nginx:install"
after "rvm:hook", "rvm:install" # need to be after rvm hook so we have rvm_path

# configure dependencies
after "deploy:updating", "nginx:configure"
