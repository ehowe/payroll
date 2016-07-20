class TimeclockPunch < ApplicationRecord
  scope :punched_in, -> { where(out: nil) }

  belongs_to :user, inverse_of: :timeclock_punches

  validates_presence_of :user

  validates_with TimeclockPunchValidator, on: :create
end
