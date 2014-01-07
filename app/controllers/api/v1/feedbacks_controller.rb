module Api
  module V1
    class FeedbacksController < ApiController
      FEEDBACK_EXAMPLE = %q(
{
'scheme_id'=>1,
'feedback' => {
  'score'=>1,
  'description'=>'I really liked their suggestions'
}
}
)
      before_action :authenticate, only: :create
      before_action :ensure_feedback_provided, only: :create

      expose(:scheme)

      # return all approved or filter by scheme
      def index
        @feedbacks = Feedback.approved.for_scheme(scheme)
      end

      def create
        feedback = scheme.feedbacks.build(feedback_params)

        feedback.save

        respond_with feedback, location: [:api, :v1, scheme, :feedbacks]
      end

      private

      def ensure_feedback_provided
        render json: { request_example: FEEDBACK_EXAMPLE } unless params[:feedback]
      end

      def feedback_params
        # make sure to not add "approved" attribute here
        params.require(:feedback).permit(
          :score, :description
        )
      end
    end
  end
end
