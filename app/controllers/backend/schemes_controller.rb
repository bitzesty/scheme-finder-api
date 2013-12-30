module Backend
  class SchemesController < Backend::BaseController
    expose(:schemes)
    expose(:scheme, attributes: :scheme_params)

    def create
      if scheme.save
        redirect_to [:backend, scheme],
                    notice: "Scheme created"
      else
        render :new
      end
    end

    def update
      if scheme.save
        redirect_to [:backend, scheme],
                    notice: "Scheme updated"
      else
        render :edit
      end
    end

    def destroy
      scheme.destroy
      redirect_to [:backend, scheme],
                  notice: "Scheme deleted"
    end

    def new
    end

    def edit
    end

    def index
    end

    def show
    end

    private

    def scheme_params
      params.require(:scheme).permit(
        :had_direct_interactions, :employees_number_range_id, :logo, :logo_cache
      )
    end
  end
end
