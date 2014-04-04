module Backend::ImportViaCsv
  class ImportErrorsController < ImportViaCsv::BaseController
    expose(:import_errors) { csv_import.import_errors.page(params[:page]) }
  end
end
