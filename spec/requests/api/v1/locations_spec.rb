require 'spec_helper'

describe Api::V1 do
  describe 'locations listing' do
    let(:response_pattern_override) {
      { locations: [ { id: String, name: String, group: String } ].ignore_extra_values! }
    }
    it_behaves_like 'Filter Criteria endpoint for', :locations
  end
end
