module Api
  module V1
    class SchemesController < ApiController
      def index
        @schemes = SchemeSearch.new.results
      end
    end
  end
end
