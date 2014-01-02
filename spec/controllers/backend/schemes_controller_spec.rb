require 'spec_helper'

describe Backend::SchemesController, 'POST to #create' do
  let(:user) { create :user }

  before { sign_in user }

  context 'with non unique scheme names' do
    let(:scheme) { create :scheme }
    let(:scheme_attributes) { attributes_for :scheme, name: scheme.name }

    before { scheme }

    it 'does not raise RecordNotUnique exception' do
      expect {
        post :create, scheme: scheme_attributes
      }.not_to raise_error
    end

    it 'does not persist second scheme' do
      expect {
        post :create, scheme: scheme_attributes
      }.not_to change { Scheme.count }
    end
  end
end

describe Backend::SchemesController, 'PATCH to #update' do
  let(:user) { create :user }

  before { sign_in user }

  context 'with non unique scheme names' do
    let(:orig_scheme) { create :scheme }
    let(:scheme)      { create :scheme }
    let(:existing_scheme_name) { orig_scheme.name }

    before do
      orig_scheme
      scheme
    end

    it 'does not raise RecordNotUnique exception' do
      expect {
        patch :update, id: scheme.id, scheme: { name: existing_scheme_name }
      }.not_to raise_error
    end

    it 'does not update scheme name' do
      expect {
        patch :update, id: scheme.id, scheme: { name: existing_scheme_name }
      }.not_to change { scheme.reload.name }
    end
  end
end
