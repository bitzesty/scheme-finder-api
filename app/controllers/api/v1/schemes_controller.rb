module Api
  module V1
    class SchemesController < ApiController
      PER_PAGE = 10
      SCHEMA_EXAMPLE = %q(
{
  'scheme' => {
    'had_direct_interactions'=>'false',
    'sector_ids'=>['business_services'],
    'activity_ids'=>['lesson_materials'],
    'age_range_ids'=>['over_18'],
    'commitment_length_ids'=>['longer_term'],
    'company_size_ids'=>['250-500'],
    'contact_name'=>'Jim Bim',
    'contact_email'=>'person1@example.com',
    'contact_phone'=>'0771233445',
    'name'=>'Scheme 1',
    'website'=>'example.com',
    'description'=>'Host a short visit'
  }
}
)
      before_action :authenticate, only: :create
      before_action :ensure_scheme_provided, only: :create

      def index
        @schemes = SchemeSearch.new(
          locations: params[:locations],
          sectors: params[:sectors],
          activities: params[:activities],
          age_ranges: params[:age_ranges],
          commitment_lengths: params[:commitment_lengths],
          company_sizes: params[:company_sizes]
        ).results

        if filter_page
          @total = @schemes.count
          @page = filter_page
          @per_page = filter_per_page
          @schemes = @schemes.page(filter_page).per(filter_per_page)
        end
      end

      def create
        scheme = Scheme.new(scheme_params)

        scheme.persist

        respond_with scheme, location: [:api, :v1, :schemes]
      end

      def show
        scheme = Scheme.find(params[:id])
        respond_with scheme
      end

      private

      def filter_page
        params[:page] && params[:page].to_i
      end

      def filter_per_page
        (params[:per_page] || PER_PAGE).to_i
      end

      def ensure_scheme_provided
        render json: { request_example: SCHEMA_EXAMPLE } unless params[:scheme]
      end

      def scheme_params
        # make sure to not add "confirmed" attribute here
        params.require(:scheme).permit(
          :had_direct_interactions, :logo,
          :contact_name, :contact_email, :contact_phone,
          :name, :website, :description,
          location_ids: [],
          sector_ids: [],
          commitment_length_ids: [],
          activity_ids: [],
          company_size_ids: [],
          age_range_ids: []
        )
      end
    end
  end
end
