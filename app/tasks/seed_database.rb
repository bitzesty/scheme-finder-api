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
      user.password = '12345678'
      user.password_confirmation = '12345678'
      user.admin = true
      user.save!
      user
    end
  end
end
