# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Load custom tasks from `lib/capistrano/tasks`
Dir.glob('lib/capistrano/tasks/*.rb').each { |r| import r }

# Load custom helpers from `lib/capistrano/helpers`
Dir.glob('lib/capistrano/helpers/*.rb').each { |r| import r }
