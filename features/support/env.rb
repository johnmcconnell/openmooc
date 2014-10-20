require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

#World(FactoryGirl::Syntax::Methods)

Cucumber::Rails::Database.javascript_strategy = :truncation

After do |scenario|
  Cucumber.wants_to_quit = true if scenario.failed?
  save_and_open_page if scenario.failed?
end
