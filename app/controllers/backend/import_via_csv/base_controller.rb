module Backend::ImportViaCsv
  class BaseController < ApplicationController
    expose(:csv_import) { CsvImport.find(params[:object_id]) }
    expose(:csv_imports_type) {
      # specific type imports or all imports
      params[:type] || "CsvImport"
    }
  end
end
