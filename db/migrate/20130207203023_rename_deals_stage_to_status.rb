class RenameDealsStageToStatus < ActiveRecord::Migration
  def change
    rename_column :deals, :stage, :status
  end
end
