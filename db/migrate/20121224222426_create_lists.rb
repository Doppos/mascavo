class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :listable_item
      t.string :listable_type
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :lists, :account_id
    add_index :lists, [:listable_item, :listable_type, :account_id]
  end
end
