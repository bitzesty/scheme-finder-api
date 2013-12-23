require 'spec_helper'

describe "Backend::Schemes" do
  describe "GET /backend_schemes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get backend_schemes_path
      expect(response.status).to be(200)
    end
  end
end
