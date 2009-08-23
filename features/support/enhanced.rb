Webrat.configure do |config|
  config.mode = :selenium
  # Selenium defaults to using the selenium environment. Use the following to override this.
  config.application_environment = :cucumber
end

# this is necessary to have webrat "wait_for" the response body to be available
# when writing steps that match against the response body returned by selenium
World(Webrat::Selenium::Matchers)

require 'database_cleaner'
Before do
  # truncate your tables here, since you can't use transactional fixtures*
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
ActionController::Base.class_eval do
  protected
    def authenticate_with_open_id(identity_url = nil, options = {}, &block) #:doc:
    end 
end
end


