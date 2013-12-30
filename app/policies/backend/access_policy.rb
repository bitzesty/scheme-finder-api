module Backend
  class AccessPolicy < ApplicationPolicy
    def permitted?(section)
      case section
      when :user_management
        user.admin?
      when :scheme_management
        user.admin?
      else # allowed everywhere else unless specified otherwise above
        true
      end
    end
  end
end
