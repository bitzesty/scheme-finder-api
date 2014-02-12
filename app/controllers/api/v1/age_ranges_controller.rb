module Api
  module V1
    class AgeRangesController < Api::V1::FilterCriteriaController
      api :GET, "/v1/age_ranges", "List age ranges"
      def index
        @criteria = AgeRange.all
      end
    end
  end
end
