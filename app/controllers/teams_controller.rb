class TeamsController < ApplicationController
    include UsersHelper
    include PokemonsHelper
    def index
        redirect_if_not_logged_in
        
        if @user = User.find_by(params[:username])
            if @user = current_user
                @team = @user.teams.all
            end
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
        @team = Team.find(params[:id])
        @team.destroy
        redirect_to :teams
    end

    private
    def team_params
        params.require(:team).permit(:team_name, :user_id, :id)
    end

end
