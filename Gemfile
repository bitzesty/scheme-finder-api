source "http://rubygems.org"

gem "rails", "4.0.2"
gem "unicorn"
gem "whenever", require: false
gem "foreman"
gem "newrelic_rpm"
gem "pundit"

gem "pg"
gem "postgres_ext"
gem "pg_array_parser"

gem "devise", "~> 3.2.0"
gem "simple_form", "~> 3.0.0"
gem "kaminari"
gem "searchlight"

gem "carrierwave"
gem "mini_magick"
gem "fog"
gem "unf"

gem "sass-rails", "~> 4.0.0"
gem "coffee-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "execjs"

gem "bootstrap-sass", ">= 3.0.0.0"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "bootstrap-datepicker-rails"
gem "select2-rails"

gem "draper"
gem "decent_exposure", "~>2.3.0"
gem "active_hash", ">= 1.2.2"
gem "virtus", "~>1.0.0"
gem "hashie"
gem "jbuilder", "~> 1.2"

gem "slim-rails"

gem "memoist"

gem "hipchat", "~> 1.0.1"
gem "airbrake", github: "viperdezigns/airbrake", branch: "capistrano3"

gem "underscore-rails"
gem "gon"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "capistrano", "~> 3.0.1"
  gem "capistrano-rails", "~> 1.1.0"
  gem "capistrano-bundler"
  gem "better_errors"
  gem "binding_of_caller", platforms: [:mri_19, :mri_20, :rbx]
  gem "rails_layout"
  gem "bullet"
  gem "rails_view_annotator"
end

group :test do
  gem "capybara"
  gem "poltergeist"
  gem "launchy"
  gem "headless"
  gem "Platform", require: "platform"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "brakeman", require: false
  gem "database_cleaner"
  gem "codeclimate-test-reporter", require: nil
  gem "timecop"
  gem "json_expressions"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "quiet_assets"
  gem "forgery"
  gem "pry-rails"
  gem "byebug"
  gem "rspec-rails", "~> 2.14.0"
end
