module LoginHelpers
  def login_with_valid_user(user)
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end

RSpec.configure do |config|
  config.include LoginHelpers, type: :request
end
