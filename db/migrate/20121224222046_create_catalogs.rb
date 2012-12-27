class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :item
      t.text :description
      t.float :price
      t.boolean :active
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :catalogs, :account_id
  end
end
