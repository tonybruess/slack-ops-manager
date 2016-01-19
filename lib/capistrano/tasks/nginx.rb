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
            if install_config('config/nginx/default.conf', '/etc/nginx/conf.d/')
                invoke "nginx:reload"
            end
        end
    end

    desc "Reload nginx"
    task :reload do
        execute "service nginx reload"
    end
end
