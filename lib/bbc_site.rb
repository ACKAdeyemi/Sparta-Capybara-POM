require 'capybara/dsl'
require_relative './pages/bbc_homepage.rb'
require_relative './pages/bbc_registration.rb'
require_relative './pages/bbc_login.rb'
require_relative './pages/bbc_account.rb'
require_relative './helpers/temp_email.rb'
require_relative './helpers/switch_tabs.rb'

class BBC_Site

  def bbc_homepage
    BBC_Homepage.new
  end

  def bbc_registration
    BBC_Registration.new
  end

  def get_temp_email
    TempEmail.new
  end

  def bbc_login
    BBC_Login.new
  end

  def change_tab
    SwitchTabs.new
  end

  def bbc_account
    BBC_Account.new
  end

end

# bbc = BBC_Site.new
# bbc_home = bbc.bbc_homepage
# bbc_home.visit_home_page
