module Api
  module V1
    class SchemesController < ApiController
      SCHEMA_EXAMPLE = %q(
{
  'scheme' => {
    'had_direct_interactions'=>'false',
    'logo'=>nil,
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
      end

      def create
        scheme = Scheme.new(scheme_params)

        if scheme.persist
          render json: "Scheme created",
                 status: :ok
        else
          render json: { errors: scheme.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def ensure_scheme_provided
        render json: { request_example: SCHEMA_EXAMPLE } unless params[:scheme]
      end

      def scheme_params
        # make sure to not add "confirmed" attribute here
        params.require(:scheme).permit(
          :had_direct_interactions,  :logo,
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
