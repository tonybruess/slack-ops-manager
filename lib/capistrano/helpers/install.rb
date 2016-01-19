module Capistrano
    module Helpers
        module Install
            def install_apt(program)
                begin
                    execute "dpkg -l #{program}"
                rescue SSHKit::Command::Failed
                    execute "apt-get -y install #{program}"
                end

                return true
            end

            def install_rvm
                begin
                    execute "[ -d #{fetch(:rvm_path)} ]"
                rescue SSHKit::Command::Failed
                    execute "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
                    execute "curl -sSL https://get.rvm.io | bash -s stable --ruby"
                end
            end

            def install_config(file, folder)
                file_new = File.join(release_path, file)
                file_old = File.join(folder, File.basename(file))

                print file_new
                print file_old

                begin
                    execute "cmp #{file_new} #{file_old}"
                    return false
                rescue SSHKit::Command::Failed
                    return true
                end
            end
        end
    end
end

include Capistrano::Helpers::Install
