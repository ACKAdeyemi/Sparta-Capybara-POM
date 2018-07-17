require 'capybara/dsl'

class TempEmail
  include Capybara::DSL
  # def initialize
  #   Capybara.register_driver :chrome do |app|
  #     Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #   end
  #
  #   @session = Capybara::Session.new(:chrome)
  # end

  HOMEPAGE_URL = 'https://www.minuteinbox.com'
  DELETE_EMAIL_BUTTON = 'Delete this mailbox'
  EMAIL_TAG = '#email'

  def visit_minute_inbox
    # @session.visit(HOMEPAGE_URL)
    visit(HOMEPAGE_URL)
  end

  def get_email
    # p @session.find(EMAIL_TAG).text
    find(EMAIL_TAG).text
  end


end

# email = TempEmail.new
# email.visit_minute_inbox
# email.get_email
