class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name, default: ""
      t.string :location, default: ""
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
