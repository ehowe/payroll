require 'rails_helper'

feature "as an administrator" do
  let!(:admin) { build :user, :admin }

  it "prompts for login" do
    visit admin_users_path

    expect(page.current_path).to eq("/users/sign_in")
  end

  context "that is logged in" do
    before(:each) { login_as admin, scope: :user }

    it "lists the users" do
      visit admin_users_path

      expect(page).to have_selector("a[href='#{admin_user_path(admin.id)}']")
      expect(page).to have_content(admin.first_name)
      expect(page).to have_content(admin.last_name)
    end
  end
end
