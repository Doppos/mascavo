class Source < ActiveRecord::Base

  attr_accessible :active, :created_by, :description, :name, :type, :updated_by

  belongs_to :account
  has_many :contacts

end
