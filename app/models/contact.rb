class Contact < ActiveRecord::Base

  attr_accessible :active, :birthdate, :created_by, :date, :image, :name, :notes, :public, :status, :updated_by

  belongs_to :account
  belongs_to :source
  has_many :jobs, :dependent => :destroy
  has_many :companies, :through => :jobs
  has_many :activities, :as => :activitable, :dependent => :destroy

  accepts_nested_attributes_for :activities, :reject_if => proc { |a| a[:description].blank? }, :allow_destroy => true

end
