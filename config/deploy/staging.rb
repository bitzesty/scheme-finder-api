set :stage, :staging
set :ip, "162.13.156.110"
set :domain_name, "scheme-finder-api.dev.bitzesty.com"

server fetch(:ip), user: fetch(:user), roles: %w(app web db)
