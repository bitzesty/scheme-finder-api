require 'spec_helper'

describe Api::V1 do
  describe 'feedback filtering' do
    context 'no filter arguments supplied' do
      let(:feedback) { create :feedback, :approved }
      let(:unapproved_feedback) { create :feedback, :unapproved }
      let(:response_pattern) {
        { feedbacks: [ { id: feedback.id }.ignore_extra_keys!] }
      }

      it 'returns all approved feedbacks' do
        feedback
        unapproved_feedback

        get '/api/v1/feedbacks.json'

        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with filter by scheme' do
      let(:scheme) { create :scheme }
      let(:feedback_for_scheme) { create :feedback, :approved, scheme: scheme }
      let(:feedback) { create :feedback, :approved }
      let(:response_pattern) {
        { feedbacks: [ { id: feedback_for_scheme.id }.ignore_extra_keys!] }
      }

      let(:invalid_response_pattern) {
        { feedbacks: [ { id: feedback.id }.ignore_extra_keys!] }
      }

      before {
        feedback
        feedback_for_scheme

        get '/api/v1/feedbacks.json', scheme_id: scheme.id
      }

      it 'returns feedbacks specific to provided scheme' do
        expect(response.body).to match_json_expression response_pattern
      end

      it 'does not return irrelevant feedback' do
        expect(response.body).not_to match_json_expression invalid_response_pattern
      end
    end
  end
end
