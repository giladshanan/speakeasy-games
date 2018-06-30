class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :orders
  has_many :characters, through: :orders
  has_many :games, through: :orders

  def set_default_role
    self.role ||= :user
  end

  def full_name
    first_name + " " + last_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  before_invitation_created :email_admins
  after_invitation_accepted :email_invited_by
  
  def email_admins
    # ...
  end

  def email_invited_by
    # ...
  end
end

