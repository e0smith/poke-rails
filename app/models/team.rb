class Team < ApplicationRecord
    belongs_to :user
    has_many :team_pokemon
    has_many :pokemons, through: :team_pokemon
end
