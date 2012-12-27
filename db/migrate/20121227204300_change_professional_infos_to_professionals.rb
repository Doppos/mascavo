class ChangeProfessionalInfosToProfessionals < ActiveRecord::Migration
  def change
    remove_index :professional_infos, :company_id
    remove_column :professional_infos, :resource_id
    remove_column :professional_infos, :resource_type
    rename_table :professional_infos, :professionals
    add_column :professionals, :contact_id, :integer
    add_column :professionals, :created_by, :integer
    add_column :professionals, :updated_by, :integer
    add_index :professionals, :company_id
    add_index :professionals, :contact_id
  end
end
