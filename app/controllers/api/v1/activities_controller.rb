module Api
  module V1
    class ActivitiesController < Api::V1::FilterCriteriaController
      def index
        @criteria = Activity.all
      end
    end
  end
end
