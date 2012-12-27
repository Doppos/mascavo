class Activity < ActiveRecord::Base

  attr_accessible :created_by, :datetime, :description, :status, :updated_by

  belongs_to :account
  belongs_to :activitable, :polymorphic => true

end
