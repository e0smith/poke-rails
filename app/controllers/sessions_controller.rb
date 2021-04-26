class SessionsController < ApplicationController
    require 'securerandom'

    def new
    end

    def create
        @user = User.find_by(params[:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            render 'users/show'
        else
            render :new
        end
    end

    def destroy
        session.clear
        render :'welcome/home'
    end

    def omniauth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth[:info][:name]
        u.email = auth[:info][:email]
        u.image = auth[:info][:image]
        u.uid = auth[:uid]
        u.provider = auth[:provider]
        u.password = SecureRandom.hex(10)
      end

      session[:user_id] = @user.id
  
      render 'welcome/home'
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
end