module Api
  module V1
    class SchemesController < ApiController
      def index
        @schemes = SchemeSearch.new(
          locations: params[:locations],
          sectors: params[:sectors],
          activities: params[:activities],
          age_ranges: params[:age_ranges],
          commitment_lengths: params[:commitment_lengths],
          company_sizes: params[:company_sizes]
        ).results
      end
    end
  end
end
