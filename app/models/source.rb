class Source < ActiveRecord::Base

  attr_accessible :active, :created_by, :description, :name, :label, :updated_by

  belongs_to :account
  has_many :contacts

end
