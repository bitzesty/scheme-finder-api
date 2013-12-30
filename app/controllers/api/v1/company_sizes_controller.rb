module Api
  module V1
    class CompanySizesController < Api::V1::FilterCriteriaController
      def index
        @criteria = CompanySize.all
      end
    end
  end
end
