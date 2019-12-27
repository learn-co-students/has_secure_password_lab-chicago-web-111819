class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        unless @user.password == @user.password_confirmation
            redirect_to new_user_path
        else
            session[:user_id] = @user.id
            redirect_to welcome_main_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end