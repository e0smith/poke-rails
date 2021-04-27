class TeamsController < ApplicationController
    include UsersHelper
    def index
        if @user = User.find_by(params[:username])
            @team = @user.teams.all
            
        end
    end

    def show
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        @team.user_id = current_user.id
        if @team.save
            flash[:message] = "Team Successfuly Created!"
            redirect_to :teams
        else
            flash[:message] = "Team failed to save!"
            render :new
        end
    end

    def destroy
    end

    private
    def team_params
        params.require(:team).permit(:team_name, :user_id, :id)
    end
end
