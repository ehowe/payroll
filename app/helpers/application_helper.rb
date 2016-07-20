module ApplicationHelper
  def timeclock_button_label(user)
    "Clock #{user.clocked_in? ? "out" : "in"} #{user.full_name}"
  end
end
