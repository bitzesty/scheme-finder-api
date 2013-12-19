module SchemeFinderApi
  DEFAULT_PARAMS = {
  }

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= OpenStruct.new(DEFAULT_PARAMS)
    yield(configuration)
  end
end
