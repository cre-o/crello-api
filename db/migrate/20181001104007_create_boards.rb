class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :resource_id, null: false
      t.boolean :private, null: false, default: false
      t.timestamps
    end

    add_index :boards, :resource_id, unique: true
  end
end
