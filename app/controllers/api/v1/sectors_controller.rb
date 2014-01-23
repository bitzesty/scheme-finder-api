module Api
  module V1
    class SectorsController < Api::V1::FilterCriteriaController
      def index
        @criteria = Sector.exposable_via_api
      end
    end
  end
end
