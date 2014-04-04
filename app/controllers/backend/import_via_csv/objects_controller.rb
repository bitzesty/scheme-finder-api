module Backend::ImportViaCsv
  class ObjectsController < ImportViaCsv::BaseController
    expose(:csv_imports) { csv_imports_class.most_recent.page(params[:page]) }
    expose(:csv_import) { CsvImport.find(params[:id]) }

    def index
    end

    def show
      respond_to do |format|
        # for updating result for asynchronous importing
        format.json do
          render json: {
            state: csv_import.state,
            saved_count: csv_import.saved_count,
            failed_count: csv_import.failed_count
          }, status: 200
        end
      end
    end

    private
    def csv_imports_class
      csv_imports_type.constantize
    end
  end
end
