# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/webkit'
require "capybara/session"
require 'headless'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"


  #Capybara.run_server = false

  #if Rails.env.production?
  #    headless = Headless.new
  #    headless.start
  #end

  #config.include Capybara::DSL
  #config.include Capybara::DSL, type: :request

  config.before(:all) do
    #Capybara.current_driver = :webkit
    Capybara.default_driver = :webkit
    Capybara.default_selector = :css
    Capybara.javascript_driver = :webkit
    #Capybara.app_host = 'http://www.google.com'
  end

  #Capybara.register_driver :webkit do |app|
  #  Capybara::Driver::Webkit.new(app, :ignore_ssl_errors => true)
  #end
  #Capybara.run_server = false
  #Spork.prefork do
    # Loading more in this block will cause your tests to run faster. However,
    # if you change any configuration or code from libraries loaded here, you'll
    # need to restart spork for it take effect.

    # ここから追加
    require "headless"
    headless = Headless.new(:display => 99)
    headless.start
    at_exit{ headless.destroy }
  #end

end
