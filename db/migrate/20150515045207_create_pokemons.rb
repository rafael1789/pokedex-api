class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false, limit: 30
      t.string :uuid, null: false
      t.string :avatar
      t.decimal :height, precision: 7, scale: 2, default: 0.00
      t.decimal :weight, precision: 7, scale: 2, default: 0.00

      t.timestamps
    end
    add_index :pokemons, :name, unique: true
    add_index :pokemons, :uuid, unique: true
  end
end
