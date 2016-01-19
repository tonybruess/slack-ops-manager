module Capistrano
    module Helpers
        module Install

            # Attempts to install a package via apt-get
            # Returns true if it is not already installed
            def install_apt(package)
                if not test("dpkg -l #{package}")
                    execute("apt-get -y install #{package}")
                    return true
                else
                    return false
                end
            end

            # Attempts to install a configuration file
            # Returns true if the configuration file is created or changed
            def install_config(file, folder)
                file_new = File.join(release_path, file)
                file_old = File.join(folder, File.basename(file))

                if (not test("[ -f #{file_old} ]")) || (not test("cmp #{file_new} #{file_old}"))
                    execute("cp #{file_new} #{file_old}")
                    return true
                else
                    return false
                end
            end
        end
    end
end

include Capistrano::Helpers::Install
