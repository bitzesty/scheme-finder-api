module UserSteps
  # Query
  #
  # returns true if user is signed in at given time
  # and false otherwise
  def signed_in(user)
    visit root_path

    !page.has_content?('You need to sign in')
  end

  # Command
  #
  # signs user out
  def sign_out_user(user)
    visit root_path

    click_link 'Sign out'
  end
end
