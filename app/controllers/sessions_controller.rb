class SessionsController < ApplicationController
    require 'securerandom'

    def new
    end

    def create
    end

    
    def omniauth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.provider = auth[:provider]
        u.password = SecureRandom.hex(10)
      end

      session[:user_id] = @user.id
  
      render 'welcome/home'
    end

    def failure
        redirect_to :root
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
end