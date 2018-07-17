require 'spec_helper'

describe "Testing the BBC Login" do

  context "testing login" do

    it "should respond with success when we login with a valid email and password" do
      @bbc_site = BBC_Site.new
      @bbc_site.change_tab.switch_to_tab_one
      email = @bbc_site.get_temp_email.get_email
      password = 'iloveCODE12'
      @bbc_site.change_tab.switch_to_tab_two
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      # need to sign out here
      @bbc_site.bbc_account.click_sign_out_link
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email(email)
      @bbc_site.bbc_login.fill_password(password)
      @bbc_site.bbc_login.submit_log_in
      @bbc_site.bbc_registration.wait
    end

  end

end
