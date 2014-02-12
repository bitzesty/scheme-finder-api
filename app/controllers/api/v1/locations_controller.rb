module Api
  module V1
    class LocationsController < Api::V1::FilterCriteriaController
      api :GET, "/v1/locations", "List locations"
      def index
        @criteria = Location.exposable_via_api
      end

      private
      def criteria_attributes
        [:id, :name, :group]
      end
    end
  end
end
