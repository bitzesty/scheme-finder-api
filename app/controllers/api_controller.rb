class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cache_headers

  respond_to :json

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      token == SchemeFinderApi.api_access_token
    end if SchemeFinderApi.api_access_token.present?
  end

  private
  def set_cache_headers
    expires_in 1.hour, public: true
  end
end
