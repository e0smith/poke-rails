class CreateTeamPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :team_pokemons do |t|
      t.integer :team_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
