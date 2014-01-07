module Api
  module V1
    class FeedbacksController < ApiController
      FEEDBACK_EXAMPLE = %q(
{
  'feedback' => {
    'score'=>1,
    'scheme_id'=>'1',
    'description'=>'I really liked their suggestions'
  }
}
)
      before_action :authenticate, only: :create
      before_action :ensure_feedback_provided, only: :create

      # return all approved or filter by scheme
      def index
        @feedbacks = Feedback.approved
        if scheme_id_param.present?
          @feedbacks = @feedbacks.for_scheme_id(scheme_id_param)
        end
      end

      def create
        feedback = Feedback.new(feedback_params)

        feedback.save

        respond_with feedback, location: [:api, :v1, :feedbacks]
      end

      private

      def ensure_feedback_provided
        render json: { request_example: FEEDBACK_EXAMPLE } unless params[:feedback]
      end

      def feedback_params
        # make sure to not add "approved" attribute here
        params.require(:feedback).permit(
          :score, :scheme_id, :description
        )
      end

      def scheme_id_param
        params[:scheme_id] && params[:scheme_id].to_i
      end
    end
  end
end
