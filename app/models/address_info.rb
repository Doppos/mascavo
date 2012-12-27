class AddressInfo < ActiveRecord::Base

  attr_accessible :city, :latitude, :longitude, :preferable, :state, :street, :type, :zipcode

  belongs_to :resource, :polymorphic => true

end
