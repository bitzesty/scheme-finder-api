require "spec_helper"

describe SchemeSearch do
  let(:search_class) { SchemeSearch }
  let(:searcher) { search_class.new(search_params) }
  let(:search_params) {}
  let(:result) { searcher.results }

  describe "#search_locations" do
    let(:search_params) do
      { locations: locations }
    end
    let!(:all_england_scheme) { create :scheme, :confirmed, location_ids: ["england"] }
    let!(:north_east_scheme) { create :scheme, :confirmed, location_ids: ["north_east"] }

    context "When searching for all of england locations and scotland" do
      let(:locations) { ["england", "scotland"] }
      let!(:scotland_scheme) { create :scheme, :confirmed, location_ids: ["scotland"] }
      let!(:wales_scheme) { create :scheme, :confirmed, location_ids: ["wales"] }

      it "Then returns all schemes for england and the scotland schemes" do
        expect(result).to include all_england_scheme, north_east_scheme, scotland_scheme
        expect(result).to have(3).items
      end
    end

    context "When searching north east" do
      let(:locations) { ["north_east"] }

      it "Then returns north east locations" do
        expect(result).to eq [north_east_scheme]
      end
    end
  end
end
