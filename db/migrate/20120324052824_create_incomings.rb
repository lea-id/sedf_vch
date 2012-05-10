class CreateIncomings < ActiveRecord::Migration
  def change
    create_table :incomings do |t|
      t.integer :year_at
      t.integer :serial_no
      t.string :doc_no
      t.date :doc_date
      t.string :address
      t.string :description
      t.integer :copy_count
      t.string :copy_no
      t.integer :pages
      t.integer :in_out_no
      t.integer :delo_no
      t.string :delo_pages
      t.string :attach
      t.references :user

      t.timestamps
    end
    add_index :incomings, :user_id
  end
end
