namespace :rvm do
    desc "Install rvm"
    task :install do
        on roles(:all) do |host|
            install_rvm
        end
    end
end
