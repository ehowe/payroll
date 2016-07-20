class TimeclockController < ApplicationController
  def punch
    message = user.timeclock.punch_clock
    flash[:message] = {info: message}
  end

  def update
  end

  protected

  def user
    @_user ||= User.find(params[:id])
  end
end
