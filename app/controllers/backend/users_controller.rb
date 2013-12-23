module Backend
  class UsersController < Backend::BaseController
    expose(:users)
    expose(:user, attributes: :user_params)

    def new
    end

    def create
      if user.save
        redirect_to backend_users_url, notice: 'User successfully created'
      else
        render :new
      end
    end

    def update
      if user.save
        redirect_to backend_users_url, notice: 'User information successfully updated'
      else
        render :edit
      end
    end

    def edit
    end

    def destroy
      user.destroy

      redirect_to backend_users_url, notice: 'User successfully removed'
    end

    private

    def user_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, :admin
      )
    end
  end
end
