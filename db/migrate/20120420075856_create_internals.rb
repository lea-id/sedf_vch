class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.string :title
      t.string :description
      t.string :attach
      t.references :user

      t.timestamps
    end
    add_index :internals, :user_id
  end
end
