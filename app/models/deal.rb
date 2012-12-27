class Deal < ActiveRecord::Base

  attr_accessible :date, :stage

  belongs_to :account

end
