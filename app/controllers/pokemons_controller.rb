class PokemonsController < ApplicationController
    include PokemonsHelper
    
    def index
        @pokemons = Pokemon.search(params[:name])
    end

    def show
        @info = Pokemon.pokemon_data(params[:id])
    end

    def search
        @pokemon = Pokemon.search(params[:name])
        redirect_to pokemons_path
    end
end
