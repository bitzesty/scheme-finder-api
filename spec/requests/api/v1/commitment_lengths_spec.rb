require 'spec_helper'

describe Api::V1 do
  describe 'commitment lengths listing' do
    it_behaves_like 'Filter Criteria endpoint for', :commitment_lengths
  end
end
