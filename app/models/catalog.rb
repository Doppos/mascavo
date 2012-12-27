class Catalog < ActiveRecord::Base

  attr_accessible :active, :description, :item, :price

  belongs_to :account

end
