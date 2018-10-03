class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :board, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.integer :position, null: false, default: 1
      t.timestamps
    end
  end
end
