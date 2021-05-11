class Team < ApplicationRecord
    belongs_to :user
    has_many :team_pokemons
    has_many :pokemons, through: :team_pokemons
    accepts_nested_attributes_for :team_pokemons
    validates :team_name, presence: true
end
