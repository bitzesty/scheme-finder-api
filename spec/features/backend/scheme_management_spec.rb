require 'spec_helper'

describe 'Scheme management' do
  include Backend::SchemeSteps

  let(:admin) { create :admin }
  before { sign_in_user(admin) }

  describe 'scheme creation' do
    let(:new_scheme) { build :scheme }

    specify 'scheme can be created' do
      verify !scheme_created?(new_scheme)

      create_scheme(new_scheme)

      verify scheme_created?(new_scheme)
    end
  end

  describe 'scheme edit' do
    let(:existing_scheme) { create :scheme, name: 'existing_scheme' }

    specify 'scheme details can be updated' do
      verify scheme_created?(existing_scheme)

      update_scheme(existing_scheme, name: 'new_scheme_name')

      verify scheme_updated?(existing_scheme, name: 'new_scheme_name')
    end
  end

  describe "scheme confirmation" do
    let(:existing_scheme) { create :scheme, :unconfirmed }

    specify "scheme can be confirmed" do
      verify scheme_not_confirmed?(existing_scheme)
      confirm_scheme(existing_scheme)
      verify scheme_confirmed?(existing_scheme)
    end
  end

  describe 'scheme removal' do
    let(:existing_scheme) { create :scheme }

    specify 'scheme can be removed' do
      verify scheme_created?(existing_scheme)

      remove_scheme(existing_scheme)

      verify !scheme_created?(existing_scheme)
    end
  end
end
