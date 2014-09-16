require 'raven'

Raven.configure do |config|
  config.dsn = ENV["GETSENTRY"] if ENV["GETSENTRY"]
end
