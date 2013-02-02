class Job < ActiveRecord::Base

  attr_accessible :position, :primary_contact, :company_id, :contact_id

  belongs_to :company
  belongs_to :contact

end
