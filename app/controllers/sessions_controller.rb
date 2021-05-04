class SessionsController < ApplicationController
    require 'securerandom'
    include UsersHelper
    def new
      redirect_if_logged_in
    end

    def create
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Log in Successful."
            session[:user_id] = @user.id
            redirect_to users_path
        else
            flash[:message] = "Log in unuccessful."
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to :root
    end

    def omniauth
      redirect_if_logged_in
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth[:info][:name]
        u.email = auth[:info][:email]
        u.username = auth[:info][:name]
        u.uid = auth[:uid]
        u.provider = auth[:provider]
        u.password = SecureRandom.hex(10)
        u.save
      end

      session[:user_id] = @user.id
  
      redirect_to pokemons_path
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
end