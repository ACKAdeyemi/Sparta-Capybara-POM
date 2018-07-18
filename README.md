# <p align="center"> Sparta Capybara POM </p>

#### Task:

To create a Page Object Model using Capybara, creating an automated user journey through a website and test for expected failures.

This task makes use of:

* Ruby
* Capybara (for web automation)
* RSpec (for testing)
* [Minute Inbox](https://www.minuteinbox.com)

**How to Download** - click 'clone or download' button, download a zip of our project, unzip, open the index.html and enjoy.

#### Challenges:
Something that I thought to be interesting was to add dynamic email functionality to ease the automation process rather than having to constantly change the email used to prove that the registration process works, getting locked out of account due to too many incorrect log in attempts, etc.

I knew I'd need to be able to switch tabs as I'd need the email taken from the Minute Inbox tab to remain, so I conducted some research via Google and came to the following solution:

### <p align="center"> Class created with methods to control tabs in one window </p>



```ruby

# Code Snippet of methods from my TabControl class (in tab_control.rb)

require 'capybara/dsl'

class TabControl
  include Capybara::DSL

  def switch_to_tab_one
    page.switch_to_window(page.windows[0])
    sleep 1
  end

  def switch_to_tab_two
    page.switch_to_window(page.windows[1])
    sleep 1
  end

  def refresh_tab
    page.driver.browser.navigate.refresh
  end

  def close_tab
    page.driver.browser.close
  end

  def wait(num)
    sleep num
  end

end
```

### <p align="center"> The method below is used in conjunction with the methods above to control what happens at particular stages through the user journey </p>

```ruby
# Code snippet of method in used within BBC_Homepage class (in bbc_homepage.rb)

# constants
HOMEPAGE_URL = 'http://www.bbc.co.uk'

def visit_home_page
  window = page.driver.browser.window_handles

  if window.size < 2
    page.driver.open_new_window
    page.switch_to_window(page.windows[1])
  end

  visit(HOMEPAGE_URL)
  sleep 2
end
```

<hr>

#### Summary:
I am quite pleased with this homework task as it enabled me to go above and beyond what was required allowing me to push myself to learn new things and implement something that functions well and makes life easier.
