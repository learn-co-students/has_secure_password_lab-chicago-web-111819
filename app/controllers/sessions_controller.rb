class SessionsController < ApplicationController
    def login
        @user = User.new
    end

    def create
        redirect_hash = {}
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            redirect_hash = {controller: 'users', action: 'welcome'}
            session[:user_id] = @user.id
        else
            redirect_hash = {controller: 'sessions', action: 'login'}
        end
        redirect_to(redirect_hash)
    end
end
