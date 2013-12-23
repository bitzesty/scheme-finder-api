require 'spec_helper'

describe 'User sign out' do
  include UserSteps

  let(:user) { create :user }

  before { sign_in_user(user) }

  specify 'user can sign out' do
    verify signed_in(user)

    sign_out_user(user)

    verify !signed_in(user)
  end
end
