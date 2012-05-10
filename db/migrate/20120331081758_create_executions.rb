class CreateExecutions < ActiveRecord::Migration
  def change
    create_table :executions do |t|
      t.integer :year_at
      t.integer :serial_no
      t.string :resolution
      t.date :execute_to
      t.string :data_control
      t.string :done
      t.references :user
      t.references :incoming

      t.timestamps
    end
    add_index :executions, :user_id
    add_index :executions, :incoming_id
  end
end
