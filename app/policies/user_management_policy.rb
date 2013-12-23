class UserManagementPolicy < ApplicationPolicy
  def initialize(user)
    super

    raise Pundit::NotAuthorizedError, "must be an admin" unless user.admin?
  end
end
