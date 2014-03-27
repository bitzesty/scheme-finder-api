set :stage, :production
set :rails_env, :production
set :branch, ENV["BRANCH"] || "production"

set :ip, "89.200.142.59"
set :domain_name, "makeitingreatbritain.bis.gov.uk"

set :assets_prefix, 'backend/assets'

server fetch(:ip), user: fetch(:user), roles: %w(app web db)
