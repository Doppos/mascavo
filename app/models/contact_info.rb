class ContactInfo < ActiveRecord::Base

  attr_accessible :name, :preferable, :type, :value

  belongs_to :resource, :polymorphic => true

end
