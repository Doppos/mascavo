class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_ids, :as => :admin

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify

  def role
    self.roles.first.name unless self.roles.empty?
  end

end
