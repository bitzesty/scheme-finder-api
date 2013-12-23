module AuthenticationMacros
  [:user].each do |user_type|
    module_eval <<-RUBY, __FILE__, __LINE__ + 1
      def sign_in_#{user_type}(#{user_type} = nil)                # def sign_in_admin(admin = nil)
        #{user_type} = #{user_type} || create(:#{user_type})      #   admin = admin || create(:admin)
                                                                  #
        visit new_#{user_type}_session_path                       #   visit new_admin_session_path
        fill_in 'Email', with: #{user_type}.email                 #   fill_in 'Email', with: admin.email
        fill_in 'Password', with: #{user_type}.password           #   fill_in 'Password', with: admin.password
        click_button 'Sign in'                                    #   click_button 'Login'
      end                                                         # end
    RUBY
  end
end
