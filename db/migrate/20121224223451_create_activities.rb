class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :datetime
      t.text :description
      t.string :status
      t.references :activitable, :polymorphic => true
      t.references :account
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :activities, :account_id
    add_index :activities, [:status, :account_id]
    add_index :activities, [:datetime, :account_id]
    add_index :activities, [:status, :activitable_id, :activitable_type], :name => "index_activities_on_status_and_activitable"
    add_index :activities, [:datetime, :activitable_id, :activitable_type], :name => "index_activities_on_datetime_and_activitable"
  end
end
