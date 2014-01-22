set :stage, :vagrant
set :rails_env, :vagrant
set :ip, "10.0.100.15"
set :domain_name, "scheme-finder-api.app"

server fetch(:ip), user: fetch(:user), roles: %w(app web db)
