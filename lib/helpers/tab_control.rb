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
