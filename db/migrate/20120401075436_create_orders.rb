class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :year_at
      t.integer :serial_no
      t.date :sign_date
      t.string :someone
      t.string :description
      t.integer :copy_count
      t.string :attach

      t.timestamps
    end
  end
end
