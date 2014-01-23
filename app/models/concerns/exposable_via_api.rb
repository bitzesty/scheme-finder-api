module ExposableViaApi
  extend ActiveSupport::Concern

  ID_FOR_ALL = "all"

  module ClassMethods
    def exposable_via_api
      all.reject do |item|
        item.id == ID_FOR_ALL
      end
    end
  end
end
