module Api
  module V1
    class LocationsController < Api::V1::FilterCriteriaController
      def index
        @criteria = Location.all
      end

      private
      def criteria_attributes
        [:id, :name, :group]
      end
    end
  end
end
