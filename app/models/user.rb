class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :image, :image_cache
  attr_accessible :role_ids, :as => :admin

  has_and_belongs_to_many :accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify

  def role
    self.roles.first.name unless self.roles.empty?
  end

  def account
    self.accounts.first unless self.accounts.empty?
  end

end
