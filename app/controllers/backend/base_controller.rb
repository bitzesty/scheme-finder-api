module Backend
  class BaseController < ApplicationController
    include Pundit

    layout 'backend'

    respond_to :html

    before_filter :authenticate_user!

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      redirect_to root_path, alert: "You are not authorized to perform this action"
    end

    def access_policy
      @access_policy ||= Backend::AccessPolicy.new(current_user)
    end
    helper_method :access_policy
  end
end
