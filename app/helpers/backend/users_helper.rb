# -*- coding: utf-8 -*-

module Backend
  module UsersHelper
    def confirmation_icon(value)
      if value
        content_tag(:span, '✓', class: 'badge badge-success')
      else
        content_tag(:span, '✘', class: 'badge badge-important')
      end
    end
  end
end
