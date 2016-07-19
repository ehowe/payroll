class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    super
    current_user.administrator?
  end
end
