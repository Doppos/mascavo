class List < ActiveRecord::Base

  attr_accessible :name

  belongs_to :account
  belongs_to :listable, :polymorphic => true

end
