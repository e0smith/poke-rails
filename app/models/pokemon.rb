class Pokemon < ApplicationRecord
    has_many :team_pokemons
    has_many :teams, through: :team_pokemons
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    def self.pokemon_data(id)
        information = {
            "name" => [],
            "abilities" => [],
            "types" => [],
            "moves" => [],
            "sprites" => [] }
        pokemon = Pokemon.find(id)
        @info = HTTParty.get(pokemon.url)
        information["name"] << pokemon.name
        @info["abilities"].each do |x|
            information["abilities"] << x["ability"]["name"]
        end
        @info["types"].each do |x|
          information["types"] << x["type"]["name"]
        end
        @info["moves"].each do |x|
          information["moves"] << x["move"]["name"]
        end
        @info["sprites"].each do |x|
            information["sprites"] << x
        end
        return information
    end
end
