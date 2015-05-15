class CreateWeaknesses < ActiveRecord::Migration
  def change
    create_table :weaknesses do |t|
      t.references :pokemon, index: true
      t.string :name, null: false, limit: 30

      t.timestamps
    end
  end
end
