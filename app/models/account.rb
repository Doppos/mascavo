class Account < ActiveRecord::Base

  attr_accessible :created_by, :email, :image, :name, :updated_by

  has_and_belongs_to_many :users

end
