class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.date :completed_at
      t.date :due_date
      t.integer :priority, default: 1
      t.integer :user_id
      t.timestamps
    end
  end
end
