class DeleteTeamIdFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :team_id
  end
end
