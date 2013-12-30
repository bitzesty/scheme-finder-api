require 'spec_helper'

describe Api::V1 do
  describe 'locations listing' do
    it_behaves_like 'Filter Criteria endpoint for', :locations
  end
end
