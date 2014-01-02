require "codeclimate-test-reporter"
require "capybara/poltergeist"
require 'json_expressions/rspec'

CodeClimate::TestReporter.start
Capybara.javascript_driver = :poltergeist

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[
  Rails.root.join('spec/features/steps/*.rb'),
  Rails.root.join('spec/features/steps/**/*.rb')
].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # Remove this line if you"re not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include ExpectationHelpers
  config.include ClickOnHelper
  config.include Devise::TestHelpers, type: :controller
  config.include ModalHelper
  config.include AuthenticationMacros, type: :feature
  config.include FeaturesHelpers, type: :feature

  # Cleanup for carrierwave files
  # See config/environments/test.rb for more details
  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/tmp/uploads"])
  end
end
