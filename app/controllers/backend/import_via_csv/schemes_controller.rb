module Backend::ImportViaCsv
  class SchemesController < ApplicationController
    expose(:csv_import) { CsvImports::Scheme.new(csv_import_params) }
    expose(:csv_import_type) { "CsvImports::Scheme" }

    def import_form
      self.csv_import = CsvImports::Scheme.new
    end

    def import
      if csv_import.save
        csv_import.schedule_import

        redirect_to import_via_csv_objects_path(type: csv_import.type),
                    notice: "The import has been scheduled"
      else
        render :import_form
      end
    end

    private
    def csv_import_params
      params.require(:csv_import).permit(
        :file, :file_cache
      )
    end
  end
end
