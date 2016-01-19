namespace :php5_fpm do
    desc "Install php5-fpm"
    task :install do
        on roles(:all) do |host|
            install_apt 'php5-fpm'
        end
    end
end
