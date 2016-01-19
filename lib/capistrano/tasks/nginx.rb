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
            uninstalled = uninstall_config('/etc/nginx/sites-enabled/default')
            installed = install_config('config/nginx/default.conf', '/etc/nginx/conf.d/')

            # reload nginx if either config changed
            if uninstalled || installed
                execute "service nginx reload"
            end
        end
    end
end
