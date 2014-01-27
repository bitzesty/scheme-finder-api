class SeedDatabase
  class << self
    def run
      user = create_user
    end

    private

    def create_user
      user = User.find_or_initialize_by(
        email: 'user@example.com'
      )
      user.password = 'As12Df34_!'
      user.password_confirmation = 'As12Df34_!'
      user.admin = true
      user.save!
      user
    end
  end
end
