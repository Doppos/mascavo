class RenameProfessionalsToJobs < ActiveRecord::Migration
  def change
    remove_index :professionals, :company_id
    remove_index :professionals, :contact_id
    rename_table :professionals, :jobs
    add_index :jobs, :company_id
    add_index :jobs, :contact_id
  end
end
