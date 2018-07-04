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
    # example of before invitation created callback
  end

  def email_invited_by
    # example of after invitation accepted callback
  end

  def invitation_accepted?
    # or maybe just call valid? ??
    # or try invited_to_sign_up?
    created_by_invite? && User.invitation_accepted.include?(self)
  end
end

