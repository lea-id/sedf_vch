class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :year_at
      t.date :date_incoming
      t.integer :serial_no
      t.date :date_finishing
      t.references :user
      t.references :incoming

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :incoming_id
  end
end
