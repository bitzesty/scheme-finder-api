require 'spec_helper'

describe 'Feedback management' do
  include Backend::FeedbackSteps

  let(:admin) { create :admin }
  before { sign_in_user(admin) }

  describe 'feedback creation' do
    let(:new_feedback) { build :feedback }

    specify 'feedback can be created' do
      verify !feedback_created?(new_feedback)

      create_approved_feedback(new_feedback)

      verify feedback_created?(new_feedback)
    end
  end

  describe 'feedback edit' do
    let(:existing_feedback) { create :feedback, :approved, description: 'existing_feedback' }

    specify 'feedback details can be updated' do
      verify feedback_created?(existing_feedback)

      update_feedback(existing_feedback, description: 'new_feedback_description')
      approve_feedback(existing_feedback)

      verify feedback_updated?(existing_feedback, description: 'new_feedback_description')
    end
  end

  describe "feedback approval" do
    let(:existing_feedback) { create :feedback, :unapproved }

    specify "feedback can be approved" do
      verify !feedback_approved?(existing_feedback)

      approve_feedback(existing_feedback)

      verify feedback_approved?(existing_feedback)
    end
  end

  describe 'feedback removal' do
    let(:existing_feedback) { create :feedback, :approved }

    specify 'feedback can be removed' do
      verify feedback_created?(existing_feedback)

      remove_feedback(existing_feedback)

      verify !feedback_created?(existing_feedback)
    end
  end

  describe 'feedback listing' do
    let(:approved_feedback) { create :feedback, :approved, description: "nice scheme" }
    let(:unapproved_feedback) { create :feedback, :unapproved, description: "not good one" }

    before do
      approved_feedback
      unapproved_feedback
    end

    specify 'lists approved feedbacks in approved feedbacks page' do
      verify feedback_listed?(approved_feedback, feedbacks_path)
      verify !feedback_listed?(unapproved_feedback, feedbacks_path)
    end

    specify 'lists unapproved feedbacks in unapproved feedbacks page' do
      verify !feedback_listed?(approved_feedback, unapproved_feedbacks_path)
      verify feedback_listed?(unapproved_feedback, unapproved_feedbacks_path)
    end
  end
end
