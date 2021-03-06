require 'simplecov'
require 'simplecov-console'
require './app/app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './spec/web_helpers'

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|
  require './lib/setup_test_database'
  config.before(:each) do
    clearout
    # Whatever you put here will happen before each spec runs
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
