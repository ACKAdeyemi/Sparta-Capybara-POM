require 'capybara/dsl'

class SwitchTabs
  include Capybara::DSL

  def switch_to_tab_one
    page.switch_to_window(page.windows[0])
    sleep 1
  end

  def switch_to_tab_two
    page.switch_to_window(page.windows[1])
    sleep 1
  end

end
