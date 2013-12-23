module Backend
  class BaseController < ApplicationController
    include Pundit

    layout 'backend'

    before_filter :authenticate_user!

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      redirect_to dashboard_root_path, error: "You are not authorized to perform this action"
    end
  end
end
