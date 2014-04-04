class CsvImportDecorator < ApplicationDecorator
  def created_at
    h.l object.created_at
  end

  def path_for_status_update
    h.csv_imports_object_path object,
                              format: :json
  end

  def status
    case state
    when "pending" then "Pending..."
    when "completed" then "Completed"
    when "errored" then "Resulted in an error"
    end
  end

  def output
    case state
    when "pending" then "Import in progress"
    when "completed" then "Completed"
    when "errored" then ""
    end
  end
end
