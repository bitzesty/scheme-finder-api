require 'spec_helper'

describe Api::V1 do
  describe 'activities listing' do
    let(:response_pattern_override) {
      { activities: [ { id: String,
                        name: String,
                        for_businesses: String,
                        for_teachers: String } ].ignore_extra_values! }
    }
    it_behaves_like 'Filter Criteria endpoint for', :activities
  end
end
