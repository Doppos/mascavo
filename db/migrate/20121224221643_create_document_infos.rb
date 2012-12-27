class CreateDocumentInfos < ActiveRecord::Migration
  def change
    create_table :document_infos do |t|
      t.string :name
      t.string :value
      t.string :type
      t.boolean :preferable
      t.references :resource, :polymorphic => true

      t.timestamps
    end
  end
end
