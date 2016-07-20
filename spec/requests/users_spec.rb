require 'rails_helper'

feature "with a user" do
  let!(:user) { create :user }

  context "not logged in" do
  end

  context "that is logged in" do
    before(:each) { login_as user, scope: :user }

    context "and not clocked in" do
      before(:each) { visit user_path(user) }

      it "shows the timeclock button" do
        expect(page).to have_content("Clock in #{user.full_name}")
        expect(page).to have_selector("a[href='#{punch_clock_user_path(user)}']:contains('Punch Clock')")
      end

      it "clocks in" do
        expect do
          click_link "Punch Clock"
        end.to change { user.clocked_in? }.to(true)
      end
    end

    context "and clocked in" do
      before(:each) do
        user.timeclock_punches << create(:timeclock_punch, :clocked_in, user: user)
        visit user_path(user)
      end

      it "shows the timeclock button" do
        expect(page).to have_content("Clock out #{user.full_name}")
        expect(page).to have_selector("a[href='#{punch_clock_user_path(user)}']:contains('Punch Clock')")
      end

      it "clocks out" do
        expect do
          click_link "Punch Clock"
        end.to change { user.clocked_in? }.to(false)
      end
    end
  end
end
