module BuildForCsvImport
  class Scheme
    DIRECT_ATTRIBUTES = %w(
      name
      website
      contact_name
      contact_email
      contact_phone
    )

    def self.build(attributes)
      new(attributes).run.result
    end

    attr_reader :attributes
    delegate :assign_belongs_to_relation, :formatted_attributes, to: :CsvImportUtil

    def initialize(attributes)
      @attributes = attributes
    end

    def result
      scheme
    end

    def scheme
      @scheme ||= ::Scheme.find_or_initialize_by(name: attributes[:name].strip)
    end

    def run
      begin
        # transaction will "cancel" all the records that were created during scheme build
        ::Scheme.transaction do
          assign_description
          assign_locations
          assign_sectors
          assign_activities
          assign_age_ranges
          assign_company_sizes
          assign_direct_attributes
          mark_confirmed
        end
      rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique
        # the failures ^^ used to trigger transaction rollback
      end

      self
    end

    def assign_description
      scheme.description = attributes[:description].gsub("\u00E2", "*").gsub("\u0080¢", " ")
    end

    def assign_locations
      assign_active_hash_ids scheme, :location_ids, Location, :id, extract_ids_for(:locations)
    end

    def assign_sectors
      assign_active_hash_ids scheme, :sector_ids, Sector, :id, extract_ids_for(:sectors)
    end

    def assign_activities
      assign_active_hash_ids scheme, :activity_ids, Activity, :id, extract_ids_for(:activities)
    end

    def assign_age_ranges
      assign_active_hash_ids scheme, :age_range_ids, AgeRange, :id, extract_ids_for(:age_range)
    end

    def assign_company_sizes
      assign_active_hash_ids scheme, :company_size_ids, CompanySize, :id, extract_ids_for(:company_size)
    end

    def direct_attribute_values
      attributes.slice *DIRECT_ATTRIBUTES.map(&:to_sym)
    end

    def assign_direct_attributes
      # assigns contact_email
      scheme.assign_attributes(direct_attribute_values)
    end

    def mark_confirmed
      scheme.confirmed = true
    end

    private
    def extract_ids_for(attribute)
      if attributes[attribute]
        attributes[attribute].split(",").map(&:strip).map(&:downcase)
      end
    end

    def assign_active_hash_ids(object, attribute, relation_klass, finder_key, finder_attributes)
      if finder_attributes
        found_relation_ids =
          finder_attributes.map do |finder_attribute|
            found_relation = relation_klass.public_send("find_by_#{finder_key}", finder_attribute)
            if found_relation
              found_relation.id
            else
              object.errors.add(:base, "#{relation_klass} was not found by #{formatted_attributes(finder_key => finder_attribute)}")
              nil
            end
          end.compact

        object.public_send "#{attribute}=", found_relation_ids
      else
        object.errors.add(:base, "Could not find #{attribute}")
      end
    end
  end
end
