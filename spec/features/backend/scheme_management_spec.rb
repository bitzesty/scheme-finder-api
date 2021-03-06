require 'spec_helper'

describe 'Scheme management' do
  include Backend::SchemeSteps

  let(:admin) { create :admin }
  before { sign_in_user(admin) }

  describe 'scheme creation' do
    let(:new_scheme) { build :scheme }

    specify 'scheme can be created' do
      verify !scheme_created?(new_scheme)

      create_confirmed_scheme(new_scheme)

      verify scheme_created?(new_scheme)
    end
  end

  describe 'scheme edit' do
    let(:existing_scheme) { create :scheme, :confirmed, name: 'existing_scheme' }

    specify 'scheme details can be updated' do
      verify scheme_created?(existing_scheme)

      update_scheme(existing_scheme, name: 'new_scheme_name')
      confirm_scheme(existing_scheme)

      verify scheme_updated?(existing_scheme, name: 'new_scheme_name')
    end
  end

  describe "scheme confirmation" do
    let(:existing_scheme) { create :scheme, :unconfirmed }

    specify "scheme can be confirmed" do
      verify !scheme_confirmed?(existing_scheme)

      confirm_scheme(existing_scheme)

      verify scheme_confirmed?(existing_scheme)
    end
  end

  describe 'scheme removal' do
    let(:existing_scheme) { create :scheme, :confirmed }

    specify 'scheme can be removed' do
      verify scheme_created?(existing_scheme)

      remove_scheme(existing_scheme)

      verify !scheme_created?(existing_scheme)
    end
  end

  describe 'scheme listing' do
    let(:confirmed_scheme) { create :scheme, :confirmed }
    let(:unconfirmed_scheme) { create :scheme, :unconfirmed }

    before do
      confirmed_scheme
      unconfirmed_scheme
    end

    specify 'lists confirmed schemes in confirmed schemes page' do
      verify scheme_listed?(confirmed_scheme, schemes_path)
      verify !scheme_listed?(unconfirmed_scheme, schemes_path)
    end

    specify 'lists unconfirmed schemes in unconfirmed schemes page' do
      verify !scheme_listed?(confirmed_scheme, unconfirmed_schemes_path)
      verify scheme_listed?(unconfirmed_scheme, unconfirmed_schemes_path)
    end
  end
end
