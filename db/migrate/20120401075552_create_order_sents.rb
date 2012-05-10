class CreateOrderSents < ActiveRecord::Migration
  def change
    create_table :order_sents do |t|
      t.string :who
      t.string :letter
      t.integer :copy_count
      t.string :delo
      t.references :order

      t.timestamps
    end
    add_index :order_sents, :order_id
  end
end
