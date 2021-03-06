require 'spec_helper'

describe Api::V1 do
  describe 'scheme filtering' do
    context 'no filter arguments supplied' do
      let(:scheme) { create :scheme, :confirmed }
      let(:unconfirmed_scheme) { create :scheme, :unconfirmed }
      let(:response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      it 'returns all confirmed schemes' do
        scheme
        unconfirmed_scheme

        get '/api/v1/schemes.json'

        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with filter by location' do
      let(:scheme) { create :scheme, :confirmed, location_ids: ["north_east"] }
      let(:scheme_with_location) { create :scheme, :confirmed, location_ids: ["wales"] }
      let(:response_pattern) {
        { schemes: [ { id: scheme_with_location.id }.ignore_extra_keys!] }
      }

      let(:invalid_response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      before {
        scheme
        scheme_with_location

        get '/api/v1/schemes.json', locations: scheme_with_location.location_ids
      }

      it 'returns schemes specific to provided location' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant scheme' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end

    context 'with filter by sector' do
      let(:scheme) { create :scheme, :confirmed, sector_ids: ["auto"] }
      let(:scheme_with_sector) { create :scheme, :confirmed, sector_ids: ["aero"] }
      let(:response_pattern) {
        { schemes: [ { id: scheme_with_sector.id }.ignore_extra_keys! ] }
      }

      let(:invalid_response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      before {
        scheme
        scheme_with_sector

        get '/api/v1/schemes.json', sectors: scheme_with_sector.sector_ids
      }

      it 'returns schemes specific to provided sector' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant scheme' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end

    context 'with filter by activity' do
      let(:scheme) { create :scheme, :confirmed, activity_ids: ["apprenticeships"] }
      let(:scheme_with_activity) { create :scheme, :confirmed, activity_ids: ["lesson_materials"] }
      let(:response_pattern) {
        { schemes: [ { id: scheme_with_activity.id }.ignore_extra_keys! ] }
      }

      let(:invalid_response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      before {
        scheme
        scheme_with_activity

        get '/api/v1/schemes.json', activities: scheme_with_activity.activity_ids
      }

      it 'returns schemes specific to provided activity' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant scheme' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end

    context 'with filter by age range' do
      let(:scheme) { create :scheme, :confirmed, age_range_ids: [AgeRange.first.id] }
      let(:scheme_with_age_range) { create :scheme, :confirmed, age_range_ids: [AgeRange.last.id] }
      let(:response_pattern) {
        { schemes: [ { id: scheme_with_age_range.id }.ignore_extra_keys! ] }
      }

      let(:invalid_response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      before {
        scheme
        scheme_with_age_range

        get '/api/v1/schemes.json', age_ranges: scheme_with_age_range.age_range_ids
      }

      it 'returns schemes specific to provided age_range' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant scheme' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end

    context 'with filter by company size' do
      let(:scheme) { create :scheme, :confirmed, company_size_ids: ["0-9"] }
      let(:scheme_with_company_size) { create :scheme, :confirmed, company_size_ids: [CompanySize.last.id] }
      let(:response_pattern) {
        { schemes: [ { id: scheme_with_company_size.id }.ignore_extra_keys! ] }
      }

      let(:invalid_response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      before {
        scheme
        scheme_with_company_size

        get '/api/v1/schemes.json', company_sizes: scheme_with_company_size.company_size_ids
      }

      it 'returns schemes specific to provided company_size' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant scheme' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end

    context 'with page filter' do
      let(:scheme) { create :scheme, :confirmed, name: "first" }
      let(:second_scheme) { create :scheme, :confirmed, name: "second" }
      let(:response_pattern) {
        {
          schemes: [ { id: second_scheme.id }.ignore_extra_keys! ],
          total: 2,
          page: 2,
          per_page: 1,
        }
      }

      before {
        scheme
        second_scheme

        get '/api/v1/schemes.json', page: "2", per_page: "1"
      }

      it 'returns schemes for given page' do
        expect(response.body).to match_json_expression response_pattern
      end
    end

    describe "with filter by all" do
      let(:scheme) { create :scheme, :confirmed }
      let(:response_pattern) {
        {
          schemes: [ { id: scheme.id }.ignore_extra_keys! ],
          total: 1,
          page: 1,
          per_page: 5,
        }
      }

      before {
        scheme

        get '/api/v1/schemes.json',
            locations: [scheme.location_ids.first],
            sectors: [scheme.sector_ids.first],
            audiences: [scheme.audience_ids.first],
            activities: [scheme.activity_ids.first],
            age_ranges: [scheme.age_range_ids.first],
            company_sizes: [scheme.company_size_ids.first],
            page: 1,
            per_page: 5
      }

      it "it returns the matched scheme", :api_doc do
        expect(response.body).to match_json_expression response_pattern
      end
    end
  end
end
