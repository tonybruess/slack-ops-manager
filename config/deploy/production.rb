# Production servers
# ==================
# These servers get deployed to in the production stage

server '50.16.44.122', roles: %w{app db}

# Also deploy all the staging servers
load File.expand_path('staging.rb', File.dirname(__FILE__))
