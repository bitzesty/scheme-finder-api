module Backend
  class SchemesController < Backend::BaseController
    expose(:schemes) { |default| default.by_name }
    expose_decorated(:scheme, attributes: :scheme_params)

    def create
      flash.notice = 'Scheme successfully created' if scheme.persist

      respond_with(scheme, location: scheme)
    end

    def update
      flash.notice = 'Scheme successfully updated' if scheme.persist

      respond_with(scheme, location: scheme)
    end

    def destroy
      scheme.destroy

      redirect_to scheme,
                  notice: "Scheme deleted"
    end

    def new
    end

    def edit
    end

    def index
      self.schemes = schemes.confirmed
    end

    def unconfirmed
      self.schemes = schemes.unconfirmed

      render :index
    end

    def show
    end

    private

    def scheme_params
      params.require(:scheme).permit(
        :had_direct_interactions,  :logo, :logo_cache, :confirmed,
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
