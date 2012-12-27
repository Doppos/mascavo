class AddCreatedByAndUpdatedByToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :created_by, :integer
    add_column :accounts, :updated_by, :integer
  end
end
