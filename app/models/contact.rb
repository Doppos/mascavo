class Contact < ActiveRecord::Base

  attr_accessible :active, :birthdate, :created_by, :date, :image, :name, :notes, :public, :type, :updated_by

  belongs_to :account
  belongs_to :source
  has_many :companies, :through => :professionals

end
