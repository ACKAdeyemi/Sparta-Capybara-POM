require 'spec_helper'

describe "Testing the BBC Login" do

  context "testing login" do

    before(:all) do
      @bbc_site = BBC_Site.new
      @email
      @password = 'iloveCODE12'
    end

    it "should respond with success when we login with a valid email and password" do
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      # need to sign out here
      @bbc_site.bbc_account.click_sign_out_link
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.fill_password(@password)
      @bbc_site.bbc_login.submit_log_in
      @bbc_site.tab_control.refresh_tab
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_account.click_sign_out_link
    end

    it "should correctly display an error message for empty password form field" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.empty_password_error_div).to eq true

      expect(@bbc_site.login_fail_methods.empty_password_error_message).to eq 'Something\'s missing. Please check and try again.'
    end

    it "should correctly display an error message for empty email form field" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_password(@password)
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.empty_email_error_div).to eq true

      expect(@bbc_site.login_fail_methods.empty_email_error_message).to eq 'Something\'s missing. Please check and try again.'
    end

    it "should correctly display an error message for password with less than 8 characters" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.fill_password('abc123')
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.short_password_error_div).to eq true

      expect(@bbc_site.login_fail_methods.short_password_error_message).to eq 'Sorry, that password is too short. It needs to be eight characters or more.'
    end

    it "should correctly display an error message for password that only uses letters" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.fill_password('abcdefgh')
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.only_letters_password_error_div).to eq true

      expect(@bbc_site.login_fail_methods.only_letters_password_error_message).to eq 'Sorry, that password isn\'t valid. Please include something that isn\'t a letter.'
    end

    it "should correctly display an error message for password that only uses numbers" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.fill_password('12345678')
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.only_numbers_password_error_div).to eq true

      expect(@bbc_site.login_fail_methods.only_numbers_password_error_message).to eq 'Sorry, that password isn\'t valid. Please include a letter.'
    end

    it "should correctly display an error message for password that isn't correct for the account" do
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.tab_control.switch_to_tab_one
      @email = @bbc_site.get_temp_email.get_email
      @bbc_site.tab_control.switch_to_tab_two
      @bbc_site.bbc_login.fill_email(@email)
      @bbc_site.bbc_login.fill_password('1234abcd')
      @bbc_site.bbc_login.submit_log_in

      expect(@bbc_site.login_fail_methods.incorrect_account_password_error_div).to eq true

      expect(@bbc_site.login_fail_methods.incorrect_account_password_error_message).to eq 'Uh oh, that password doesn\'t match that account. Please try again.'
      @bbc_site.tab_control.wait(4)
    end

  end

end
