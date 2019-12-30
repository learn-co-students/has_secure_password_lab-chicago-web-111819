require 'pry'
class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.password != @user.password_confirmation
            redirect_to new_user_path
        else
            session[:user_id] = @user.id 
            # binding.pry
            redirect_to user_path(@user)
        end
        
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
