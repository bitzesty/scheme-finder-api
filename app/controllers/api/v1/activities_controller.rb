module Api
  module V1
    class ActivitiesController < Api::V1::FilterCriteriaController
      api :GET, "/v1/activities", "List activities"
      def index
        @criteria = Activity.exposable_via_api
      end

      private
      def criteria_attributes
        [:id, :name, :for_businesses, :for_teachers]
      end
    end
  end
end
