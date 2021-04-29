class AddColumnNicknameToTeamsPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :team_pokemons, :nickname, :string
  end
end
