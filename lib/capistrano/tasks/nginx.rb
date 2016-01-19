namespace :nginx do
    desc "Install nginx"
    task :install do
        on roles(:all) do |host|
            install_apt 'nginx'
        end
    end

    desc "Configure nginx"
    task :configure do
        on roles(:all) do |host|
            install_config 'config/nginx/default.conf', '/etc/nginx/conf.d/'
        end
    end
end
