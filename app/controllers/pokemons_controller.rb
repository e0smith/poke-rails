class PokemonsController < ApplicationController

    def pokedex
        @pokemons = Pokemon.all
        render 'pokemons/pokedex/index'
    end

    def info
    end
end
