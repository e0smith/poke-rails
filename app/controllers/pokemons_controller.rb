class PokemonsController < ApplicationController
    include PokemonsHelper
    
    def index
        pokemons
    end

    def show
        @info = Pokemon.pokemon_data(params[:id])
    end
end
