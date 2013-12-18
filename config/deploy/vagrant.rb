set :stage, :vagrant
set :ip, "10.0.100.15"
set :domain_name, "casper_vagrant.app"

server fetch(:ip), user: fetch(:user), roles: %w(app web db)
