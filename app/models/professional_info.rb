class ProfessionalInfo < ActiveRecord::Base

  attr_accessible :position, :primary_contact

  belongs_to :company

end
