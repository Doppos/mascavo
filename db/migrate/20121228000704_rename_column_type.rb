class RenameColumnType < ActiveRecord::Migration
  def change
    rename_column :address_infos, :type, :label
    rename_column :contact_infos, :type, :label
    rename_column :document_infos, :type, :label
    rename_column :online_infos, :type, :label
    rename_column :sources, :name, :value
    rename_column :sources, :type, :label
    rename_column :contacts, :type, :status
  end
end
