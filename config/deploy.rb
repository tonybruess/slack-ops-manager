# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'manager'
set :repo_url, 'git@github.com:tonybruess/slack-ops-manager.git'
set :deploy_to, '/root/manager'

# some servers require password login, ask for the password
ask(:password, 'root', echo: false)

namespace :deploy do
  before :starting, :install_git do
    on roles(:all) do
        #execute 'apt-get', 'install', 'git'
    end
  end

end
