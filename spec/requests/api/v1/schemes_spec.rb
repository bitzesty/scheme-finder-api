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
  end
end
