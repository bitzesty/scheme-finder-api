module Backend
  module FeedbackSteps
    # Query
    #
    # returns true if feedback is created, i.e. can be seen in admin
    # feedback list UI
    def feedback_created?(feedback)
      ensure_on feedbacks_path

      page.has_css?(feedbacks_table) &&
      within(feedbacks_table) do
        page.has_content?(feedback.description)
      end
    end

    # Command
    #
    # creates a feedback given mock feedback instance
    def create_feedback(feedback)
      ensure_on new_feedback_path

      within(:css, dom_id_selector(feedback)) do
        check "feedback_approved" if feedback.approved
        choose "feedback_score_#{feedback.score}"
        fill_in "feedback_description", with: feedback.description
        select feedback.scheme, from: "feedback_scheme_id"

        yield if block_given?
      end

      click_button "submit_btn"
    end

    def create_approved_feedback(feedback)
      create_feedback(feedback) do
        check "feedback_approved"
      end
    end

    # Command
    #
    # Removes feedback using backend interface
    def remove_feedback(feedback)
      ensure_on feedbacks_path

      within(feedbacks_table) do
        click_link "Remove"
      end
    end

    # Command
    #
    # Updates feedback's details
    def update_feedback(feedback, new_details = {})
      ensure_on edit_feedback_path(feedback)

      new_details.each do |field, value|
        fill_in "feedback_#{field}", with: value
      end

      yield if block_given?

      click_button "submit_btn"
    end

    # Query
    #
    # Checks if feedback details were updated
    def feedback_updated?(feedback, updated_details = {})
      ensure_on edit_feedback_path(feedback)

      updated_details.all? { |field, value|
        has_field?("feedback_#{field}", with: value)
      }
    end

    def feedbacks_table
      "table.feedbacks-table"
    end

    # Command
    #
    # Approves feedback
    def approve_feedback(feedback)
      ensure_on unapproved_feedbacks_path
      within feedbacks_table do
        click_on "approve"
      end
    end

    # Query
    #
    # Checks if feedback was approved
    def feedback_approved?(feedback)
      ensure_on edit_feedback_path(feedback)

      has_checked_field?("feedback_approved")
    end

    # Query
    #
    # Check if feedback is listed in the supplied page
    def feedback_listed?(feedback, path)
      ensure_on path

      page.has_css?(feedbacks_table) &&
        within(feedbacks_table) do
          page.has_content?(feedback.description)
        end
    end
  end
end
