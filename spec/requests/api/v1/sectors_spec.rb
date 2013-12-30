require 'spec_helper'

describe Api::V1 do
  describe 'sectors listing' do
    it_behaves_like 'Filter Criteria endpoint for', :sectors
  end
end
