class TimeclockService
  def initialize(user)
    @user = user
  end

  def punch_clock
    @user.clocked_in? ? punch_out : punch_in
  end

  def punch_out
    active_punch = @user.timeclock_punches.punched_in.first
    active_punch.update_attributes!(out: Time.now)
    "Successfully punched out #{@user.full_name}"
  end

  def punch_in
    @user.timeclock_punches.create
    "Successfully punched in #{@user.full_name}"
  end

  def clocked_in?
    @user.timeclock_punches.where.not(in: nil).where(out: nil).any?
  end
end
