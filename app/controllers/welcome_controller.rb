class WelcomeController < ApplicationController
    def main
        @user = user.find(session[:user_id])
        render "main"
    end
end