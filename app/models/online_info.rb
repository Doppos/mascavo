class OnlineInfo < ActiveRecord::Base

  attr_accessible :name, :preferable, :label, :value

  belongs_to :resource, :polymorphic => true

end
