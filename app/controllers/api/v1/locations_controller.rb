module Api
  module V1
    class LocationsController < Api::V1::FilterCriteriaController
      def index
        @criteria = Location.all
      end
    end
  end
end
