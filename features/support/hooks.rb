require 'watir-webdriver'

browser = Watir::Browser.new :chrome
browser.window.maximize

Before do
  @browser = browser
end

After do
  Janitor.clean_messes
  @browser.goto('https://na34.salesforce.com/secur/logout.jsp')
end

at_exit do
  browser.close
end