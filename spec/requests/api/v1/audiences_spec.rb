require 'spec_helper'

describe Api::V1 do
  describe 'audiences listing' do
    it_behaves_like 'Filter Criteria endpoint for', :audiences
  end
end
