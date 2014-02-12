module Api
  module V1
    class SectorsController < Api::V1::FilterCriteriaController
      api :GET, "/v1/sectors", "List sectors"
      def index
        @criteria = Sector.exposable_via_api
      end
    end
  end
end
