module Backend
  module FeedbacksHelper
    def feedbacks_index_title
      if action_name == "unapproved"
        "Unapproved feedbacks"
      else
        "Feedbacks"
      end
    end

    def feedbacks_switch_link
      if action_name == "unapproved"
        link_to "Switch to approved ones",
                [:backend, :feedbacks]
      else
        link_to "Switch to unapproved ones",
                [:unapproved, :backend, :feedbacks]
      end
    end
  end
end
