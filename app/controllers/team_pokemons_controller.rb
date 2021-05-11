class TeamPokemonsController < ApplicationController
    include UsersHelper
    require_relative "../models/pokemon.rb"
    def new
        poke_count = []
        @team = current_user.teams.find_by(params[:id])
        @team.team_pokemons.each do |x|
            poke_count << x.pokemon_id
        end
        6.times do 
            @team.team_pokemons.build
    #     i = 0
    #     loop do 
    #         i +=1
    #         6. times do @teampokemon.build
    #         if i + poke_count.length == 6
    #             break
    #         end
        end
    end

    def create
        @team = Team.find_by_id
        @team.user_id = current_user.id
        if @team.save
            flash[:message] = "Pokemon successfully added!"
            redirect_to user_teams_path(current_user)
        else
            flash[:message] = "Pokemon failed to add!"
            render :new
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
        params.require(:team_pokemons).permit(:nickname, :pokemon_id)
    end 
end
