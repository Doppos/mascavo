class CreateAddressInfos < ActiveRecord::Migration
  def change
    create_table :address_infos do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :type
      t.boolean :preferable
      t.references :resource, :polymorphic => true

      t.timestamps
    end
  end
end
