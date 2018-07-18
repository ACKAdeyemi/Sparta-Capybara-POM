require 'spec_helper'

describe "Testing the BBC Registration" do

  context "initial user journey siging up" do

    it "should take us through the correct registration process with valid details" do
      @bbc_site = BBC_Site.new
      @bbc_site.get_temp_email.visit_minute_inbox

      # grab email below
      email = @bbc_site.get_temp_email.get_email
      @bbc_site.bbc_homepage.visit_home_page

      # homepage test below
      expect(@bbc_site.bbc_homepage.confirm_home_tag).to eq 'BBC - Home'

      password = 'iloveCODE12'

      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage.click_register_link
      @bbc_site.bbc_registration.click_13_or_over
      @bbc_site.bbc_registration.choose_birthday_day
      @bbc_site.bbc_registration.choose_birthday_month
      @bbc_site.bbc_registration.choose_birthday_year
      @bbc_site.bbc_registration.confirm_birthday
      @bbc_site.bbc_registration.fill_email(email)
      @bbc_site.bbc_registration.fill_password(password)
      @bbc_site.bbc_registration.fill_postcode
      @bbc_site.bbc_registration.select_gender
      @bbc_site.bbc_registration.click_no_thanks
      @bbc_site.bbc_registration.submit_registration
      expect(@bbc_site.bbc_registration.verify_reg).to be true
      expect(@bbc_site.bbc_registration.confirm_register_tag).to eq 'BBC – Register – thank you'
      @bbc_site.tab_control.wait(2)
    end

  end

end
