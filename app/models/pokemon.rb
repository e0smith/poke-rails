class Pokemon < ApplicationRecord
    has_many :team_pokemon
    has_many :teams, through: :team_pokemon
end
