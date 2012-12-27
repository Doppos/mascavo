class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :type
      t.text :description
      t.boolean :active
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :sources, :account_id
  end
end
