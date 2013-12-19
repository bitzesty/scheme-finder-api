cookbook_path ["site-cookbooks"]
node_path     "nodes"
role_path     "roles"
data_bag_path "data_bags"
#encrypted_data_bag_secret "data_bag_key"

knife[:rackspace_api_username] = "#{ENV['RACKSPACE_USERNAME']}"
knife[:rackspace_api_key] = "#{ENV['RACKSPACE_API_KEY']}"

# staging
# export RACKSPACE_USERNAME=API.user
# export RACKSPACE_API_KEY=31b6182d059a454a8aaf4890c914e8ba

# production
# export RACKSPACE_USERNAME=API.user
# export RACKSPACE_API_KEY=31b6182d059a454a8aaf4890c914e8ba

require 'excon'
Excon.defaults[:read_timeout] = 500
