module Backend
  class FeedbacksController < Backend::BaseController
    expose(:feedbacks)
    expose_decorated(:feedback, attributes: :feedback_params)

    def create
      if feedback.save
        redirect_to feedback,
                    notice: "Feedback created"
      else
        render :new
      end
    end

    def update
      if feedback.save
        redirect_to feedback,
                    notice: "Feedback updated"
      else
        render :edit
      end
    end

    def destroy
      feedback.destroy
      redirect_to feedback,
                  notice: "Feedback deleted"
    end

    def new
    end

    def edit
    end

    def index
      self.feedbacks = feedbacks.approved
    end

    def unapproved
      self.feedbacks = feedbacks.unapproved

      render :index
    end

    def show
    end

    def approve
      self.feedback = Feedback.find(params[:id])

      if feedback.approve
        redirect_to [:unapproved, :feedbacks],
                    notice: "Feedback approved"
      else
        redirect_to [:unapproved, :feedbacks],
                    alert: "Could not approve feedback"
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(
        :scheme_id, :score, :description, :approved
      )
    end
  end
end
