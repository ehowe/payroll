require 'rails_helper'

feature "as an administrator", type: :request do
  let!(:admin) { build :user, :admin }

  it "prompts for login" do
    sign_in nil

    visit admin_users_path

    expect(page.current_path).to eq("/users/sign_in")
  end

  context "that is logged in" do
    before(:each) { login_with_valid_user admin }

    it "lists the users" do
      visit admin_users_path
    end
  end
end
