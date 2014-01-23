require 'spec_helper'

describe Api::V1 do
  describe 'submit scheme application' do
    context 'with duplicate name' do
      let(:scheme)            { create :scheme }
      let(:scheme_attributes) { attributes_for :scheme, name: scheme.name }
      let(:response_pattern) {
        { errors: { name: Array } }
      }

      it 'does not raise an exception' do
        expect {
          post '/api/v1/schemes.json', scheme: scheme_attributes
        }.not_to raise_error
      end

      it 'returns error message about duplicate name' do
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

      it 'returns success message' do
        post '/api/v1/schemes.json', scheme: scheme_attributes

        expect(response.status).to eq 201
      end
    end
  end

  private

  def ignored_scheme_attributes
    %w(created_at updated_at id confirmed)
  end
end
