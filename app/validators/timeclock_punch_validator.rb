class TimeclockPunchValidator < ActiveModel::Validator
  def validate(record)
    if record.user.clocked_in?
      record.errors.add(:base, "User is already punched in")
    end
  end
end
