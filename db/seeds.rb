require 'pry'
require './app/models/pokemon'
require 'httparty'
def fetch_pokemon
    url = "https://pokeapi.co/api/v2/pokemon?limit=10000"
    response = HTTParty.get(url)
    new_response = response.parsed_response
    fetch_abilities(response["results"])
end

def fetch_abilities(results)
    results.each do |x|
        Pokemon.create(name: x["name"], url: x["url"])
    end
end

def fetch_pokemon_type
end
fetch_pokemon
