class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      token == SchemeFinderApi.api_access_token
    end if SchemeFinderApi.api_access_token.present?
  end
end
