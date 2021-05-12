class TeamPokemonsController < ApplicationController
    include UsersHelper
    require_relative "../models/pokemon.rb"
    def new
        @team = current_user.teams.find_by(params[:id])
        if @team.team_pokemons.count < 6
            @teampokemon = @team.team_pokemons.build
        else
            flash[:message] = "Max amount of Pokemon on team!"
            redirect_back(fallback_location: root_path)
        end
    end

    def create
        @team = current_user.teams.find_by(params[:id])
        if @team
            x = @team.team_pokemons.build(teampokemon_params)
            if x.save
                @team.team_pokemons << x
                flash[:message] = "Pokemon successfully added!"
                redirect_to user_teams_path(current_user)
            else
                flash[:message] = "Pokemon failed to add!"
                render :new
            end
        end
    end

    def destroy
        if @pokemon = TeamPokemon.find_by(id: params[:id])
            @pokemon.destroy
            flash[:message] = "Pokemon successfuly deleted!"
        else
            flash[:message] = "Failed to delete pokemon!"
        end
        redirect_back(fallback_location: root_path)
    end

    private

    def teampokemon_params
        params.require(:team_pokemon).permit(:team_id, :nickname, :pokemon_id)
    end 
end
