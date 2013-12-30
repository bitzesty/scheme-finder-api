require 'spec_helper'

describe Api::V1 do
  describe 'company sizes listing' do
    it_behaves_like 'Filter Criteria endpoint for', :company_sizes
  end
end
