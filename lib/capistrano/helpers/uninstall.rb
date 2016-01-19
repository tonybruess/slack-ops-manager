module Capistrano
    module Helpers
        module Uninstall
            def uninstall_config(file)
                if test("[ -f #{file} ]")
                    execute("rm -f #{file}")
                    return true
                else
                    return false
                end
            end
        end
    end
end

include Capistrano::Helpers::Uninstall
