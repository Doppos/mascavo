class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.date :date
      t.string :stage
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :deals, :account_id
  end
end
