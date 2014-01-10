class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed_at
      t.integer :priority, default: 1
      t.date :due_date
      t.integer :order
      t.integer :user_id
      t.timestamps
    end
  end
end
