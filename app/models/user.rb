class User < ApplicationRecord
  has_many :roles, through: :user_roles
  has_many :user_roles

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def administrator?
    self.roles.map(&:name).include?("administrator")
  end
end
