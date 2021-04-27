class TeamsController < ApplicationController
    
    def index
       
        if @user = User.find_by(params[:username])
            @teams = @user.teams.all
        end
    end

    def show
    end

    def new
    end

    def create
    end

    def destroy
    end
end
