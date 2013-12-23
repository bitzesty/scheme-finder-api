module Backend
  class BaseController < ApplicationController
    layout 'backend'

    before_filter :authenticate_user!
  end
end
