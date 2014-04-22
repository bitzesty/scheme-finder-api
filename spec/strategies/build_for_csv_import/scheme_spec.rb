require "spec_helper"

describe BuildForCsvImport::Scheme do
  let(:builder) { described_class.new(attributes) }
  let(:attributes) do
    {
      name: name,
      locations: location_ids,
      sectors: sector_ids,
      audience: audience_ids,
      activities: activity_ids,
      age_range: age_range_ids,
      company_size: company_size_ids,
      contact_email: contact_email,
    }
  end
  let(:name) { "Cocoon" }
  let(:contact_email) { "user@example.com" }
  let(:location_ids) { "england, wales" }
  let(:sector_ids) { "auto" }
  let(:audience_ids) { "businesses" }
  let(:activity_ids) { "apprenticeships,hands_on_talks" }
  let(:age_range_ids) { "primary_school_children" }
  let(:company_size_ids) { "0-9" }

  let(:scheme) { builder.scheme }

  describe "#assign_locations" do
    let(:result) { builder.assign_locations; scheme.location_ids }

    context "When location found" do
      it "Then assigns location" do
        expect(result).to eq location_ids.split(",").map(&:strip)
      end
    end

    context "When location not found" do
      let(:location_ids) { "england2, wales" }
      it "Then adds error to scheme" do
        result

        expect(scheme.location_ids).to eq ["wales"]
        expect(scheme.errors[:base]).to have(1).item
      end
    end
  end

  describe "#assign_sectors" do
    let(:result) { builder.assign_sectors; scheme.sector_ids }

    context "When sector found" do
      it "Then assigns sector" do
        expect(result).to eq sector_ids.split(",").map(&:strip)
      end
    end
  end

  describe "#assign_audiences" do
    let(:result) { builder.assign_audiences; scheme.audience_ids }

    context "When audience found" do
      it "Then assigns audience" do
        expect(result).to eq audience_ids.split(",").map(&:strip)
      end
    end
  end

  describe "#assign_activities" do
    let(:result) { builder.assign_activities; scheme.activity_ids }

    context "When activity found" do
      it "Then assigns activity" do
        expect(result).to eq activity_ids.split(",").map(&:strip)
      end
    end
  end

  describe "#assign_age_ranges" do
    let(:result) { builder.assign_age_ranges; scheme.age_range_ids }

    context "When age_range found" do
      it "Then assigns age_range" do
        expect(result).to eq age_range_ids.split(",").map(&:strip)
      end
    end
  end

  describe "#assign_company_sizes" do
    let(:result) { builder.assign_company_sizes; scheme.company_size_ids }

    context "When company_size found" do
      it "Then assigns company_size" do
        expect(result).to eq company_size_ids.split(",").map(&:strip)
      end
    end
  end

  describe "#assign_direct_attributes" do
    let(:result) { builder.assign_direct_attributes }

    it "assigns direct attributes" do
      result
      expect(scheme.contact_email).to eq contact_email
    end
  end
end
