require 'spec_helper'

describe Api::V1 do
  describe 'submit feedback' do
    let(:scheme) { create :scheme }

    context 'with description missing' do
      let(:feedback_attributes) {
        attributes_for_feedback.except(:description)
      }

      let(:response_pattern) {
        { errors: Hash }
      }

      it 'returns error message' do
        post '/api/v1/feedbacks.json', feedback: feedback_attributes

        expect(response.status).to eq 422
        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with all attributes correct' do
      let(:feedback_attributes) {
        attributes_for_feedback
      }

      it 'returns success message' do
        post '/api/v1/feedbacks.json', feedback: feedback_attributes

        expect(response.status).to eq 201
      end
    end
  end

  private

  def attributes_for_feedback
    attributes_for(:feedback).merge(scheme_id: scheme.id)
                             .except(:approved)
  end
end
