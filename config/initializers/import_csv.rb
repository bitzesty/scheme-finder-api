ImportCsv.configure do |config|
  config.csv_file_uploader_class = "CsvFileUploader" # default carrierwave csv file uploader
  config.delay_csv_import = false                    # false by default
end
