class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      redirect_hash = new_user_path
      user = User.new(user_params)
      if user.save
        redirect_hash = {action: 'welcome'}
        session[:user_id] = user.id
      end
      redirect_to(redirect_hash)
    end

    def welcome
      @user = User.find_by(id: session[:user_id])
    end
   
    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
