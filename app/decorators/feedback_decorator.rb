class FeedbackDecorator < ApplicationDecorator
  def scheme_link
    h.object_link scheme, ->(scheme) { scheme }
  end

  def truncated_description
    if description
      h.truncate description, length: 70
    end
  end

  def approved_icon
    h.confirmation_icon approved?
  end
end
