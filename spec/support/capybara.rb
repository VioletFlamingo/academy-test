Capybara.asset_host = 'http://localhost:3000'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.current_driver = :chrome