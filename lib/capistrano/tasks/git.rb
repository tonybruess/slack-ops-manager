namespace :git do
    desc "Install git"
    task :install do
        on roles(:all) do |host|
            install_apt 'git'
        end
    end
end
