module SchemeFinderApi
  DEFAULT_PARAMS = {
    api_access_token: "development",
    frontend_app_url: "http://localhost:3001",
  }

  class << self
    attr_accessor :configuration

    # Allows default params to be accessed on Progress module
    # directly to prevent chaining
    delegate(*(DEFAULT_PARAMS.keys << { to: :configuration }))

    def configure
      self.configuration ||= OpenStruct.new(DEFAULT_PARAMS)
      yield(configuration)
    end
  end
end
