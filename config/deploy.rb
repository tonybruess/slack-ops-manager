# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'manager'
set :repo_url, 'git@github.com:tonybruess/slack-ops-manager.git'
set :deploy_to, '/usr/share/nginx/manager'

# some servers require password login, ask for the password
ask(:password, 'root', echo: false)

# set global ssh options
set :ssh_options, {
  user: 'root',
  password: fetch(:password),
}

# install dependencies
before "deploy:starting", "git:install"
before "deploy:starting", "nginx:install"
before "deploy:starting", "php5_fpm:install"

# configure dependencies
after "deploy:updated", "nginx:configure"
