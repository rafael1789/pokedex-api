class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :pokemon, index: true
      t.string :name, null: false, limit: 30

      t.timestamps
    end
  end
end
