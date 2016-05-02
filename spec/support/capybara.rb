require 'capybara/rspec'

module Helpers
  def sign_in(user)
    visit root_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'secret'

    click_button 'Log in'

    visit root_path
  end
end

RSpec.configure do |config|
  config.include Helpers, type: :feature
end
