class PokemonsController < ApplicationController

    def index
        @pokemons = Pokemon.all
    end

    def show
        @info = Pokemon.pokemon_data(params[:id])
    end
end
