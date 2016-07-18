Devise.setup do |config|
  require 'devise/orm/active_record'

  config.pepper = Rails.configuration.secret_token
  config.navigational_formats = [:html]
  config.reset_password_within = 6.hours
  config.sign_out_via = :get

  config.case_insensitive_keys = [:email]

  # keep old config
  config.email_regexp = /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
  config.reconfirmable = false
  config.skip_session_storage = []
  config.strip_whitespace_keys = []
end
