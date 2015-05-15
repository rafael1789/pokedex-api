class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :pokemon, index: true

      t.decimal :latitude, precision: 7, scale: 2, default: 0.00
      t.decimal :longitude, precision: 7, scale: 2, default: 0.00

      t.timestamps      
    end
    add_index :locations, [:pokemon_id, :latitude, :longitude], unique: true
  end
end
