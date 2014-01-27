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

      it "Then returns north east locations and all of england location" do
        expect(result).to include north_east_scheme, all_england_scheme
        expect(result).to have(2).items
      end

      context "When scheme location is marked as 'all'" do
        let!(:all_locations_scheme) { create :scheme, :confirmed, location_ids: ["all"] }
        let(:locations) { ["wales"] }

        it "Then returns the location" do
          expect(result).to eq [all_locations_scheme]
        end
      end
    end
  end

  describe "#search_activities" do
    let!(:auto_sheme) { create :scheme, :confirmed, activity_ids: ["auto"] }
    let!(:aero_sheme) { create :scheme, :confirmed, activity_ids: ["aero"] }
    let!(:all_activities_scheme) { create :scheme, :confirmed, activity_ids: ["all"] }

    let(:search_params) do
      { activities: activities }
    end
    let(:activities) { ["auto"] }

    it "returns searched activity schemes + schemes applicable for all activities" do
      expect(result).to include auto_sheme, all_activities_scheme
      expect(result).to_not include aero_sheme
    end
  end

  describe "#search_sectors" do
    let!(:auto_sheme) { create :scheme, :confirmed, sector_ids: ["auto"] }
    let!(:aero_sheme) { create :scheme, :confirmed, sector_ids: ["aero"] }
    let!(:all_sectors_scheme) { create :scheme, :confirmed, sector_ids: ["all"] }

    let(:search_params) do
      { sectors: sectors }
    end
    let(:sectors) { ["auto"] }

    it "returns searched sector schemes + schemes applicable for all sectors" do
      expect(result).to include auto_sheme, all_sectors_scheme
      expect(result).to_not include aero_sheme
    end
  end

  describe "#searching_for_some_england_location?" do
    let(:result) { searcher.searching_for_some_england_location?(locations) }

    context "When searching for some england location" do
      let(:locations) { %w(north_west) }

      it "Then returns true" do
        expect(result).to be_true
      end
    end

    context "When searching for some Wales location" do
      let(:locations) { %w(wales) }

      it "Then returns false" do
        expect(result).to be_false
      end
    end
  end
end
