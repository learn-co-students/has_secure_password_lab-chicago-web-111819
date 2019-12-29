class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      user = User.new(user_params)
      redirect_to(new_user_path) unless user.save
      session[:user_id] = user.id
      welcome # calling the 'welcome' action (defined below)
    end

    def welcome
      @user = User.find_by(id: session[:user_id])
    end
   
    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
