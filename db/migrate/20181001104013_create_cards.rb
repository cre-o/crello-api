class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :list, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
