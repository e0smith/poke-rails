class UsersController < ApplicationController
    has_secure_password
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            render :'welcome/home'
        else
            render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end