module Api
  module V1
    class CompanySizesController < Api::V1::FilterCriteriaController
      api :GET, "/v1/company_sizes", "List company sizes"
      def index
        @criteria = CompanySize.exposable_via_api
      end
    end
  end
end
