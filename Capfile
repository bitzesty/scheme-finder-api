# Load DSL and Setup Up Stages
require "capistrano/setup"

# Includes default deployment tasks
require "capistrano/deploy"

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
# require "capistrano/rvm"
# require "capistrano/rbenv"
# require "capistrano/chruby"

require "capistrano/bundler"
require 'capistrano/rails'
require "whenever/capistrano"
require "hipchat/capistrano"
require 'dotenv'

# slack notifications
require "slackistrano"

Dotenv.load # loads .env for various deploy settings

# Loads custom tasks from `lib/capistrano/tasks" if you have any defined.
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
