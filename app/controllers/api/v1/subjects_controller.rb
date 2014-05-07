module Api
  module V1
    class SubjectsController < Api::V1::FilterCriteriaController
      api :GET, "/v1/subjects", "List subjects"

      def index
        @criteria = Subject.exposable_via_api
      end
    end
  end
end
