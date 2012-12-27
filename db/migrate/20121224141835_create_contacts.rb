class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :source
      t.date :date
      t.string :name
      t.string :image
      t.date :birthdate
      t.string :type
      t.text :notes
      t.boolean :public
      t.boolean :active
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :contacts, :account_id
    add_index :contacts, :source_id
    add_index :contacts, [:type, :account_id]
    add_index :contacts, [:name, :account_id]
  end
end
