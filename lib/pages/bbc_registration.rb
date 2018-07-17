require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  # constants
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

  def click_13_or_over
    click_link(THIRTEEN_OR_OVER_LINK)
    sleep 3
  end

  def choose_birthday_day
    fill_in BIRTHDAY_DAY, with: '2'
  end

  def choose_birthday_month
    fill_in BIRTHDAY_MONTH, with: '3'
  end

  def choose_birthday_year
    fill_in BIRTHDAY_YEAR, with: '1990'
    sleep 1
  end

  def confirm_birthday
    find(CONFIRM_BIRTHDAY_LINK).click # OR
    # click_button 'Continue'
    sleep 2
  end

  def fill_email(email)
    # fill_in EMAIL, with: 'nxy52422@molms.com'
    fill_in EMAIL, with: (email)
  end

  def fill_password(password)
    fill_in PASSWORD, with: (password)
  end

  def fill_postcode
    fill_in POSTCODE, with: 'TW106TF'
  end

  def select_gender
    select 'Male', from: GENDER_DROPDOWN
  end

  def click_no_thanks
    # all(NO_THANKS_LINK)[1].click

    # better method
    all(NO_THANKS_LINK).each do |x|
      if x.text == 'No, thanks'
        x.click
      end
    end
    sleep 1
  end

  def submit_registration
    find(SUBMIT_REGISTRATION).click
    sleep 3
  end

  def verify_reg
    has_content?('You\'re now signed in')
  end

  def confirm_register_tag
    page.find('title').text
  end

  def wait
    sleep 2
  end

end
