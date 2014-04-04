module CsvImports
  class Scheme < ::CsvImport
    def build_strategy
      BuildForCsvImport::Scheme
    end
  end
end
