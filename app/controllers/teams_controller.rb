class TeamsController < ApplicationController
    include UsersHelper
    include PokemonsHelper
    def index
        redirect_if_not_logged_in
        
        if @user = User.find_by(params[:id])
            if current_user == @user
                @team = current_user.teams.all
            end
        end
    end

    def show
        @team = User.teams.find(params[:id])
        @pokemon = @team.pokemons
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
        redirect_back(fallback_location: root_path)
    end

    private
    def team_params
        params.require(:team).permit(:team_name, :user_id, :id, pokemon_ids: [])
    end
end
