module Backend
  module FeedbacksHelper
    def feedbacks_index_title
      if action_name == "unapproved"
        "Unapproved feedback"
      else
        "Feedback"
      end
    end

    def feedbacks_switch_link
      if action_name == "unapproved"
        link_to "Switch to approved ones", feedbacks_path
      else
        link_to "Switch to unapproved ones",
                [:unapproved, :feedbacks]
      end
    end
  end
end
