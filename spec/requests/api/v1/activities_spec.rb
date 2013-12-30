require 'spec_helper'

describe Api::V1 do
  describe 'activities listing' do
    it_behaves_like 'Filter Criteria endpoint for', :activities
  end
end
