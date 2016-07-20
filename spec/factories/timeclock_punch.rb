FactoryGirl.define do
  factory :timeclock_punch do
    trait :clocked_in do
      self.in Time.now - 8.hours
    end

    trait :clocked_out do
      self.in  Time.now - 8.hours
      out Time.now
    end
  end
end
