class TeamPokemon < ApplicationRecord
    belongs_to :team_pokemons
    belongs_to :pokemon
end
