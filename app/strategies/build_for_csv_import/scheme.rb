module BuildForCsvImport
  class Scheme
    DIRECT_ATTRIBUTES = %w(
      contact_email
    )

    def self.build(attributes)
      new(attributes).run.result
    end

    attr_reader :attributes
    delegate :assign_belongs_to_relation, to: :CsvImportUtil

    # example attributes
    #   name - string
    #   status - relation to Status, user specifies name
    #   location - relation to Location, user specifies location name
    #   contact_email - string
    def initialize(attributes)
      @attributes = attributes
    end

    def result
      scheme
    end

    def scheme
      @scheme ||= ::Scheme.find_or_initialize_by(name: attributes[:name])
    end

    def run
      begin
        # transaction will "cancel" all the records that were created during scheme build
        scheme.transaction do
          assign_status
          assign_location
          assign_direct_attributes
        end
      rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
        # the failures ^^ used to trigger transaction rollback
      end

      self
    end

    def assign_status
      # find status by name, assign that to scheme.status,
      # raise exception and log error when status not found by name
      assign_belongs_to_relation scheme,
                                 :status,
                                 Status,
                                 { name: attributes[:status] }
    end

    def assign_location
      # find or create by location name
      scheme.location = Location.find_or_initialize_by(name: attributes[:location])
    end

    def direct_attribute_values
      attributes.slice *DIRECT_ATTRIBUTES.map(&:to_sym)
    end

    def assign_direct_attributes
      # assigns contact_email
      scheme.assign_attributes(direct_attribute_values)
    end
  end
end
