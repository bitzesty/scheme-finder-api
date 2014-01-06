require 'spec_helper'

shared_examples_for 'Filter Criteria endpoint for' do |filter_type|
  describe 'criteria value listing' do
    let(:response_pattern) {
      if defined?(response_pattern_override)
        response_pattern_override
      else
        { filter_type => [ { id: String, name: String} ].ignore_extra_values! }
      end
    }

    it 'returns names and ids of the criterion' do
      get "/api/v1/#{filter_type}.json"

      expect(response.body).to match_json_expression response_pattern
    end
  end
end
