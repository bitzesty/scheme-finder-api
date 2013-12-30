module Api
  module V1
    class AgeRangesController < Api::V1::FilterCriteriaController
      def index
        @criteria = AgeRange.all
      end
    end
  end
end
