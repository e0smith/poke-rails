class UsersController < ApplicationController
    include UsersHelper

    
    def index
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Account successfully created."
            session[:user_id] = @user.id
            render :index
        else
            flash[:message] = "Error, account not created."
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
