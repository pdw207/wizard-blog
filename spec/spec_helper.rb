ENV['APP_ENV'] = 'test'
require_relative '../server.rb'
disable :run

require 'capybara'
require 'capybara/dsl'
Capybara.app = Sinatra::Application

if ENV['TEST_BROWSER']
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => ENV['TEST_BROWSER'].to_sym)
  end
  Capybara.current_driver = :selenium
end

RSpec.configure do |config|
  config.include Capybara::DSL
end
