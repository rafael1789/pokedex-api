class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.references :pokemon, index: true
      t.string :name, null: false, limit: 30

      t.timestamps
    end
    add_index :species, :name, unique: true
  end
end
