SchemeFinderApi::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  config.eager_load = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Compress JavaScripts and CSS
  config.assets.js_compressor  = :uglifier
  config.assets.css_compressor = :sass

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  config.log_level = :info

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  mailer_domain = "schemer_vagrant.app"

  ActionMailer::Base.smtp_settings = {
      :address        => "smtp.mailgun.org",
      :port           => 587,
      :authentication => :plain,
      :user_name      => "matt@bitzesty.com",
      :password       => "asdf12",
      :domain         => mailer_domain
  }

  config.action_mailer.default_url_options = { host: mailer_domain }

  config.action_mailer.default_options = {
    "Message-ID" => "#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@#{mailer_domain}"
  }

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  config.relative_url_root = "/backend"

  config.log_formatter = ::Logger::Formatter.new

  config.after_initialize do
    SchemeFinderApi.configure do |app_config|
      app_config.api_access_token = ENV["API_ACCESS_TOKEN"]
    end
  end
end

CarrierWave.configure do |config|
  config.storage = :file
end
