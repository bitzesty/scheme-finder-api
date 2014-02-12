require 'spec_helper'

describe Api::V1::Schemes::FeedbacksController do
  describe 'feedback fetching' do
    context 'for scheme' do
      let(:scheme) { create :scheme }
      let(:feedback_for_scheme) { create :feedback, :approved, scheme: scheme }
      let(:unapproved_feedback_for_scheme) { create :feedback, :unapproved, scheme: scheme }
      let(:feedback) { create :feedback, :approved }
      let(:response_pattern) {
        { feedbacks: [ { id: feedback_for_scheme.id }.ignore_extra_keys!] }
      }

      before {
        feedback
        feedback_for_scheme
        unapproved_feedback_for_scheme

        get "/api/v1/schemes/#{scheme.id}/feedbacks.json"
      }

      it 'returns approved feedbacks specific to provided scheme', :api_doc do
        expect(response.body).to match_json_expression response_pattern
      end
    end
  end
end
