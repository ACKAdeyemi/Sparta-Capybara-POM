# <p align="center"> Sparta Capybara POM </p>

#### Task:

To create a Page Object Model using Capybara, create an automated user journey through a website and test for expected failures.

This task makes use of:

* Ruby
* Capybara (for web automation)
* RSpec (for testing)

**How to Download** - click 'clone or download' button, download a zip of our project, unzip, open the index.html and enjoy.

#### Challenges:
I found it...

### <p align="center"> Example of Challenge or Solutiton </p>

```Ruby
# Code Snippet from my tab_control.rb
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

end
```

![Image 1](public/images/example.png)

![Image 2](public/images/example.png)

The...

<hr>

#### Summary:
I...
