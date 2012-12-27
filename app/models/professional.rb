class Professional < ActiveRecord::Base

  attr_accessible :position, :primary_contact

  belongs_to :company
  belongs_to :contact

end
