class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :trading_name
      t.string :image
      t.integer :employees
      t.float :annual_income
      t.string :industry
      t.text :notes
      t.boolean :public
      t.boolean :active
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :companies, :account_id
  end
end
