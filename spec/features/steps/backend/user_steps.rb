module Backend
  module UserSteps
    include ::UserSteps

    # Query
    #
    # returns true if user is created, i.e. can be seen in admin
    # user list UI
    def user_created?(user)
      ensure_on accounts_path

      within(users_table) do
        page.has_content?(user.email)
      end
    end

    # Command
    #
    # creates a user given mock user instance
    def create_user(user)
      ensure_on new_account_path

      within(:css, dom_id_selector(user)) do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
      end

      click_button 'Create User'
    end

    # Command
    #
    # Removes user using backend interface
    def remove_user(user)
      ensure_on accounts_path

      within(users_table) do
        click_link 'Remove'
      end
    end

    # Command
    #
    # Updates user's details
    def update_user(user, new_details = {})
      ensure_on edit_account_path(user)

      new_details.each do |field, value|
        fill_in "user_#{field}", with: value
      end

      click_button 'Update User'
    end

    # Query
    #
    # Checks if user details were updated
    def user_updated?(user, updated_details = {})
      ensure_on edit_account_path(user)

      updated_details.all? { |field, value|
        has_field?("user_#{field}", with: value)
      }
    end

    def users_table
      "table.users-table"
    end
  end
end
