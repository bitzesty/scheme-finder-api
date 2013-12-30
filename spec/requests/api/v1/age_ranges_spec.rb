require 'spec_helper'

describe Api::V1 do
  describe 'age ranges listing' do
    it_behaves_like 'Filter Criteria endpoint for', :age_ranges
  end
end
