Apipie.configure do |config|
  config.app_name                = "SchemeFinderApi"
  config.copyright               = "Copyright #{Date.today.year} Bit Zesty"
  config.api_base_url            = "/backend/api"
  config.doc_base_url            = "/backend/api/docs"
  # were is your API defined?
  config.api_controllers_matcher = File.join(Rails.root, "app", "controllers", "api", "**","*.rb")

  config.use_cache               = Rails.env.production?
  config.namespaced_resources    = true
  # do not perform actual validations, apipie is used for documentation
  config.validate                = false
  config.validate_value          = false
  config.validate_presence       = false
  # were is your API defined?
  config.markup                  = Apipie::Markup::Markdown.new
end

class FileValidator < Apipie::Validator::BaseValidator

  def validate(value)
    value.class.in?(File, ActionDispatch::Http::UploadedFile)
  end

  def self.build(param_description, argument, options, block)
    if [:file, File].include? argument
      self.new(param_description)
    end
  end

  def description
    "must be a file"
  end
end

class BooleanValidator < Apipie::Validator::BaseValidator
  def validate(value)
    %w[true false True False].include?(value.to_s)
  end

  def self.build(param_description, argument, options, block)
    if argument == :bool
      self.new(param_description)
    end
  end

  def error
    "Parameter #{param_name} expecting to be a boolean value, got: #{@error_value}"
  end

  def description
    "boolean"
  end
end

class IntegerValidator < Apipie::Validator::BaseValidator
  def initialize(param_description, argument)
    super(param_description)
    @type = argument
  end

  def validate(value)
    return false if value.nil?
    !!(value.to_s =~ /^[-+]?[0-9]+$/)
  end

  def self.build(param_description, argument, options, block)
    if argument == Integer || argument == Fixnum
      self.new(param_description, argument)
    end
  end

  def description
    "Must be #{@type}."
  end
end
