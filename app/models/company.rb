class Company < ActiveRecord::Base

  attr_accessible :active, :annual_income, :created_by, :employees, :image, :industry, :name, :notes, :public, :trading_name, :updated_by

  belongs_to :account
  has_many :contacts, :through => :professionals

end
