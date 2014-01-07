require 'spec_helper'

describe Api::V1::FeedbacksController do
  describe 'submit feedback' do
    let(:scheme) { create :scheme }

    before do
      post "/api/v1/schemes/#{scheme.id}/feedbacks.json", feedback: feedback
    end

    context 'with description missing' do
      let(:feedback) { attributes_for(:feedback).except(:description) }
      let(:response_pattern) {
        { errors: Hash }
      }

      it 'returns error message' do
        expect(response.status).to eq 422
        expect(response.body).to match_json_expression response_pattern
      end
    end

    context 'with all attributes correct' do
      let(:feedback) { attributes_for(:feedback) }

      it 'returns success message' do
        expect(response.status).to eq 201
      end
    end
  end
end
