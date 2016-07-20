class User < ApplicationRecord
  has_many :roles, through: :user_roles
  has_many :user_roles
  has_many :timeclock_punches, -> { order(created_at: :desc) }, inverse_of: :user

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  delegate :clocked_in?, to: :timeclock

  def administrator?
    self.roles.map(&:name).include?("administrator")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def timeclock
    @timeclock ||= TimeclockService.new(self)
  end
end
