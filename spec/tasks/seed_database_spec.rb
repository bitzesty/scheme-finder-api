require 'spec_helper'

describe SeedDatabase do
  it 'creates user' do
    expect { described_class.run }.to change { User.count }.from(0).to(1)
  end
end
