class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.references :pokemon, index: true
      t.string :name, null: false, limit: 30

      t.timestamps
    end
    add_index :types, :name, unique: true
  end
end
