require 'capybara/dsl'

class BBC_Account
  include Capybara::DSL

  # constants
  SIGNOUT_LINK = 'Sign out'

  def click_sign_out_link
    click_link(SIGNOUT_LINK)
    sleep 2
  end

end
