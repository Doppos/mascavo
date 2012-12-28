class AddressInfo < ActiveRecord::Base

  attr_accessible :city, :latitude, :longitude, :preferable, :state, :street, :label, :zipcode

  belongs_to :resource, :polymorphic => true

end
