require 'capybara/dsl'

class BBC_Login
  include Capybara::DSL

  # constants
  LOGIN_PAGE_URL = 'https://account.bbc.com/signin'
  EMAIL_USERNAME_INPUT = 'username'
  PASSWORD_INPUT = 'password'
  SIGN_IN_BUTTON = 'Sign in'

  def visit_signin
    visit(LOGIN_PAGE_URL)
  end

  def fill_email(email)
    fill_in EMAIL_USERNAME_INPUT, with: (email)
    sleep 1
  end

  def fill_password(password)
    fill_in PASSWORD_INPUT, with: (password)
    sleep 1
  end

  def submit_log_in
    click_button SIGN_IN_BUTTON
    sleep 10
  end

end
