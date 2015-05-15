class CreateEvolutions < ActiveRecord::Migration
  def change
    create_table :evolutions do |t|
      t.integer :unevolved_id
      t.integer :evolved_id

      t.timestamps null: false
    end
    add_index :evolutions, :unevolved_id
    add_index :evolutions, :evolved_id
    add_index :evolutions, [:unevolved_id, :evolved_id], unique: true
  end
end
