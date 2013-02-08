class Source < ActiveRecord::Base

  attr_accessible :active, :created_by, :description, :name, :label, :updated_by

  belongs_to :account
  has_many :contacts

  def name
    self.label << " - " << self.value
  end

  def active_label
    if self.active
      { :text => :active, :type => :success }
    else
      { :text => :trash, :type => :important }
    end
  end

  def created_by_user
    User.find self.created_by
  end

  def updated_by_user
    User.find self.updated_by
  end

end
