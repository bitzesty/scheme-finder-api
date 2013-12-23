require 'spec_helper'

describe 'User management' do
  include Backend::UserSteps

  let(:admin)    { create :admin }

  before { sign_in_user(admin) }

  describe 'user creation' do
    let(:new_user) { build :user }

    specify 'user can be created' do
      verify !user_created?(new_user)

      create_user(new_user)

      verify user_created?(new_user)
    end
  end

  describe 'user edit' do
    let(:existing_user) { create :user, email: 'existing_user@example.com' }

    specify 'user details can be updated' do
      verify user_created?(existing_user)

      update_user(existing_user, email: 'new_user_email@example.com')

      verify user_updated?(existing_user, email: 'new_user_email@example.com')
    end
  end

  describe 'user removal' do
    let(:existing_user) { create :user }

    specify 'user can be removed' do
      verify user_created?(existing_user)

      remove_user(existing_user)

      verify !user_created?(existing_user)
    end
  end
end
