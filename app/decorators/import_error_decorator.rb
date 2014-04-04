class ImportErrorDecorator < ApplicationDecorator
  def error_message_for_display
    error_messages.map do |attribute, messages|
      "<strong>#{attribute}:</strong> #{messages.join(", ")}"
    end.join("<br/>").html_safe
  end
end
