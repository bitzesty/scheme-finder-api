require 'spec_helper'

describe 'User sign in' do
  include UserSteps

  let(:user) { create :user }

  specify 'user can sign in to the backend' do
    verify !signed_in(user)

    sign_in_user(user)

    verify signed_in(user)
  end
end
