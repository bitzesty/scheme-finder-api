module Backend
  class AccountsController < Backend::BaseController
    expose(:users)
    expose(:user, attributes: :user_params)

    before_filter :authorize

    def index
    end

    def new
    end

    def create
      if user.save
        redirect_to accounts_url, notice: 'User successfully created'
      else
        render :new
      end
    end

    def update
      if user_updated?(user, user_params)
        redirect_to accounts_url, notice: 'User information successfully updated'
      else
        render :edit
      end
    end

    def edit
    end

    def destroy
      user.destroy

      redirect_to accounts_url, notice: 'User successfully removed'
    end

    private

    def user_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, :admin
      )
    end

    def user_updated?(user, sanitized_user_params)
      if update_with_password?
        user.update_with_password(sanitized_user_params)
      else
        user.update_without_password(sanitized_user_params)
        user.update_without_password(sanitized_user_params)
      end
    end

    def update_with_password?
      user_params[:password].present?
    end

    def authorize
      raise Pundit::NotAuthorizedError unless access_policy.permitted?(:user_management)
    end
  end
end
