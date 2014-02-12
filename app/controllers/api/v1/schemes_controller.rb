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

      api :GET, "/v1/schemes", "List schemes that apply to provided filters"
      param :activities, Array[Integer], desc: "Filter: activity ids", required: false
      param :age_ranges, Array[Integer], desc: "Filter: age range ids", required: false
      param :company_sizes, Array[Integer], desc: "Filter: company size ids", required: false
      param :locations, Array[Integer], desc: "Filter: location ids", required: false
      param :sectors, Array[Integer], desc: "Filter: sector ids", required: false
      param :page, Array[Integer], desc: "Filter: page, lists all schemes if no page provided", required: false
      param :per_page, Array[Integer], desc: "Display records per page", required: false
      def index
        @schemes = SchemeSearch.new(
          locations: params[:locations],
          sectors: params[:sectors],
          activities: params[:activities],
          age_ranges: params[:age_ranges],
          company_sizes: params[:company_sizes]
        ).results

        if filter_page
          @total = @schemes.count
          @page = filter_page
          @per_page = filter_per_page
          @schemes = @schemes.page(filter_page).per(filter_per_page)
        end
      end

      api :POST, "/v1/schemes", "Submit scheme application for admin to review"
      param :contact_name, String, desc: "Scheme contact name", required: true
      param :contact_email, String, desc: "Scheme contact email", required: true
      param :contact_phone, String, desc: "Scheme contact phone", required: true
      param :name, String, desc: "Scheme name", required: true
      param :website, String, desc: "Scheme website", required: true
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
          activity_ids: [],
          company_size_ids: [],
          age_range_ids: []
        )
      end
    end
  end
end
