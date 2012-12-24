class Account < ActiveRecord::Base

  attr_accessible :email, :image, :name

  has_and_belongs_to_many :users

end
