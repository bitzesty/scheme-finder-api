module Api
  module V1
    class SectorsController < Api::V1::FilterCriteriaController
      def index
        @criteria = Sector.all
      end
    end
  end
end
