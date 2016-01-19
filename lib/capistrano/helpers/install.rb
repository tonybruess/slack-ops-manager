module Capistrano
    module Helpers
        module Install
            def install_apt(program)
                if not test("dpkg -l #{program}")
                    execute("apt-get -y install #{program}")
                end

                return true
            end

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
