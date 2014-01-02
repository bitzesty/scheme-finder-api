require 'spec_helper'

describe Api::V1 do
  describe 'submit scheme application' do
    context 'with location missing' do
      let(:scheme_attributes) {
        build(:scheme).attributes.select do |k, v|
          !(ignored_scheme_attributes << "location_ids").include?(k)
        end
      }
      let(:response_pattern) {
        { errors: Hash }
      }

      it 'returns error message' do
        post '/api/v1/schemes.json', scheme: scheme_attributes

        expect(response.status).to eq 422
        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with all attributes correct' do
      let(:scheme_attributes) {
        build(:scheme).attributes.select do |k, v|
          !ignored_scheme_attributes.include?(k)
        end
      }
      let(:response_pattern) {
        "Scheme created"
      }

      it 'returns success message' do
        post '/api/v1/schemes.json', scheme: scheme_attributes

        expect(response.status).to eq 200
        expect(response.body).to eq response_pattern
      end
    end
  end

  private

  def ignored_scheme_attributes
    %w(created_at updated_at id confirmed)
  end
end
