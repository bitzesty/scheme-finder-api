require 'spec_helper'

describe Api::V1 do
  describe 'scheme filtering' do

    context 'no filter arguments supplied' do
      let(:scheme) { create :scheme }
      let(:response_pattern) {
        { schemes: [ { id: scheme.id }.ignore_extra_keys!] }
      }

      it 'returns all available schemes' do
        scheme

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
  end
end
