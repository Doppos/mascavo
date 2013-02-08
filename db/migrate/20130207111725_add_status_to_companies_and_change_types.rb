class AddStatusToCompaniesAndChangeTypes < ActiveRecord::Migration
  def change
    add_column :companies, :status, :string
    change_column :companies, :annual_income, :string
    change_column :companies, :employees, :string
  end
end
