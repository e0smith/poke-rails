class TeamPokemonsController < ApplicationController
    def destroy
        if @pokemon = TeamPokemon.find_by(id: params[:id])
            @pokemon.destroy
            flash[:message] = "Pokemon Successfuly Deleted!"
        else
            flash[:message] = "Failed to delete pokemon!"
        end
        redirect_back(fallback_location: root_path)
    end
end
