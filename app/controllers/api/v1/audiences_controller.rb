module Api
  module V1
    class AudiencesController < Api::V1::FilterCriteriaController
      api :GET, "/v1/audiences", "List audiences"
      def index
        @criteria = Audience.exposable_via_api
      end
    end
  end
end
