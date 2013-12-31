require 'spec_helper'

describe Api::V1 do
  describe 'scheme filtering' do
    context 'no filter arguments supplied' do
      let(:scheme) { create :scheme }
      let(:unconfirmed_scheme) { create :scheme, :unconfirmed }
      let(:response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }
      let(:empty_response_pattern) {
        { schemes: [] }
      }

      it 'returns all confirmed schemes' do
        scheme
        unconfirmed_scheme

        get '/api/v1/schemes.json'

        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with filter by location' do
      let(:scheme) { create :scheme, location_ids: [Location.first.id] }
      let(:scheme_with_location) { create :scheme, location_ids: [Location.last.id] }
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
      let(:scheme) { create :scheme, sector_ids: [Sector.first.id] }
      let(:scheme_with_sector) { create :scheme, sector_ids: [Sector.last.id] }
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
      let(:scheme) { create :scheme, activity_ids: [Activity.first.id] }
      let(:scheme_with_activity) { create :scheme, activity_ids: [Activity.last.id] }
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
      let(:scheme) { create :scheme, age_range_ids: [AgeRange.first.id] }
      let(:scheme_with_age_range) { create :scheme, age_range_ids: [AgeRange.last.id] }
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

    context 'with filter by commiment length' do
      let(:scheme) { create :scheme, company_size_ids: [CommitmentLength.first.id] }
      let(:scheme_with_company_size) { create :scheme, company_size_ids: [CommitmentLength.last.id] }
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

    context 'with filter by company size' do
      let(:scheme) { create :scheme, company_size_ids: [CompanySize.first.id] }
      let(:scheme_with_company_size) { create :scheme, company_size_ids: [CompanySize.last.id] }
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
  end
end
