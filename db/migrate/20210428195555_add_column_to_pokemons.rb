class AddColumnToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :types, :string
  end
end
