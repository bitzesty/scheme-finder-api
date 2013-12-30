module Api
  module V1
    class CommitmentLengthsController < Api::V1::FilterCriteriaController
      def index
        @criteria = CommitmentLength.all
      end
    end
  end
end
