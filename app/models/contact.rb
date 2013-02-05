class Contact < ActiveRecord::Base

  attr_accessible :active, :birthdate, :created_by, :date, :image, :name, :notes, :public, :status, :updated_by, :source_id, :account_id
  attr_accessible :jobs_attributes, :contact_infos_attributes, :address_infos_attributes, :online_infos_attributes, :document_infos_attributes

  validates :name, :status, :presence => true

  belongs_to :account
  belongs_to :source
  has_many :jobs, :dependent => :destroy
  has_many :companies, :through => :jobs
  has_many :contact_infos, :as => :resource, :dependent => :destroy
  has_many :address_infos, :as => :resource, :dependent => :destroy
  has_many :online_infos, :as => :resource, :dependent => :destroy
  has_many :document_infos, :as => :resource, :dependent => :destroy
  has_many :activities, :as => :activitable, :dependent => :destroy

  accepts_nested_attributes_for :jobs, :reject_if => proc { |a| a[:company_id].blank? && a[:position].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :contact_infos, :reject_if => proc { |a| a[:value].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :address_infos, :reject_if => proc { |a| a[:street].blank? && a[:city].blank? && a[:state].blank? && a[:zipcode].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :online_infos, :reject_if => proc { |a| a[:value].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :document_infos, :reject_if => proc { |a| a[:value].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :activities, :reject_if => :all_blank, :allow_destroy => true

  def company_list
    self.companies.map { |company| company.name }.join(', ')
  end

  def preferable_contact
    contact = self.contact_infos.find { |c| c.preferable? }
    contact.value unless contact.nil?
  end

  def status_label
    case self.status
      when "client" then :info
      when "lead" then :warning
    end
  end

  def active_label
    if self.active
      { :text => :active, :type => :success }
    else
      { :text => :trash, :type => :important }
    end
  end

  def public_label
    if self.public
      { :text => :public, :type => :success }
    else
      { :text => :private, :type => :important }
    end
  end

  def created_by_user
    User.find self.created_by
  end

  def updated_by_user
    User.find self.updated_by
  end

end
