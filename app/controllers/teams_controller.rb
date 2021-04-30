class TeamsController < ApplicationController
    include UsersHelper
    include PokemonsHelper
    def index
        redirect_if_not_logged_in

        @team = current_user.teams
    end

    def show
        @team = current_user.teams.find(params[:id])
        
    end

    def new
        @team = Team.new

        6.times do 
            @team.team_pokemons.build
        end
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
        params.require(:team).permit(:team_name, :user_id, :id, team_pokemons_attributes: [:nickname, :pokemon_id])
    end
end
