class CreateProfessionalInfos < ActiveRecord::Migration
  def change
    create_table :professional_infos do |t|
      t.references :company
      t.string :position
      t.boolean :primary_contact
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    add_index :professional_infos, :company_id
  end
end
