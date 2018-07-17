require 'capybara/dsl'

class BBC_Site

  # constants
  HOMEPAGE_URL = 'http://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-username' # for ID attribute
  # REGISTER_LINK = 'Register now' # OR
  REGISTER_LINK_2 = '.link--primary' # for class attribute
  THIRTEEN_OR_OVER_LINK = '13 or over' # for text content
  BIRTHDAY_DAY = 'dateOfBirthDay' # for name attribute
  BIRTHDAY_MONTH = 'dateOfBirthMonth'
  BIRTHDAY_YEAR = 'dateOfBirthYear'
  CONFIRM_BIRTHDAY_LINK = '#submit-button'
  EMAIL = 'email'
  PASSWORD = 'password'
  POSTCODE = 'postcode'
  GENDER_DROPDOWN = 'gender'
  NO_THANKS_LINK = '.button__text-wrapper'
  SUBMIT_REGISTRATION = '#submit-button'

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

    @session = Capybara::Session.new(:chrome)
  end

  def visit_home_page
    @session.visit(HOMEPAGE_URL)
    sleep 1
  end

  def click_sign_in_link
    @session.find(SIGN_IN_LINK_ID).click
    sleep 1
  end

  def click_register_link
    # @session.click_link(REGISTER_LINK) # OR
    @session.find(REGISTER_LINK_2).click
    sleep 1
  end

  def click_13_or_over
    @session.click_link(THIRTEEN_OR_OVER_LINK)
    sleep 5
  end

  def choose_birthday_day
    @session.fill_in BIRTHDAY_DAY, with: '2'
  end

  def choose_birthday_month
    @session.fill_in BIRTHDAY_MONTH, with: '3'
  end

  def choose_birthday_year
    @session.fill_in BIRTHDAY_YEAR, with: '1990'
    sleep 2
  end

  def confirm_birthday
    @session.find(CONFIRM_BIRTHDAY_LINK).click # OR
    # @session.click_button 'Continue'
    sleep 3
  end

  def fill_email
    @session.fill_in EMAIL, with: 'mmf69189@lakqs.com'
  end

  def fill_password
    @session.fill_in PASSWORD, with: 'bbcLover123'
  end

  def fill_postcode
    @session.fill_in POSTCODE, with: 'TW106TF'
  end

  def select_gender
    @session.select 'Male', from: GENDER_DROPDOWN
  end

  def click_no_thanks
    # @session.all(NO_THANKS_LINK)[1].click

    # better method
    @session.all(NO_THANKS_LINK).each do |x|
      if x.text == 'No, thanks'
        x.click
      end
    end
    sleep 2
  end

  def submit_registration
    @session.find(SUBMIT_REGISTRATION).click
    sleep 6
  end

end
# 
# bbc = BBC_Site.new
# bbc.visit_home_page
# bbc.click_sign_in_link
# bbc.click_register_link
# bbc.click_13_or_over
# bbc.choose_birthday_day
# bbc.choose_birthday_month
# bbc.choose_birthday_year
# bbc.confirm_birthday
# bbc.fill_email
# bbc.fill_password
# bbc.fill_postcode
# bbc.select_gender
# bbc.click_no_thanks
# bbc.submit_registration
