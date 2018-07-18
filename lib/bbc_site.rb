require 'capybara/dsl'
require_relative './pages/bbc_homepage.rb'
require_relative './pages/bbc_registration.rb'
require_relative './pages/bbc_login.rb'
require_relative './pages/bbc_account.rb'
require_relative './helpers/temp_email.rb'
require_relative './helpers/tab_control.rb'
require_relative './helpers/login_fail_methods.rb'

class BBC_Site

  def get_temp_email
    TempEmail.new
  end

  def bbc_homepage
    BBC_Homepage.new
  end

  def bbc_registration
    BBC_Registration.new
  end

  def bbc_login
    BBC_Login.new
  end

  def bbc_account
    BBC_Account.new
  end

  def tab_control
    TabControl.new
  end

  def login_fail_methods
    LoginFailMethod.new
  end

end

# bbc = BBC_Site.new
# bbc_home = bbc.bbc_homepage
# bbc_home.visit_home_page
