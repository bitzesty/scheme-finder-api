module Api
  module V1
    class ActivitiesController < Api::V1::FilterCriteriaController
      def index
        @criteria = Activity.exposable_via_api
      end
    end
  end
end
