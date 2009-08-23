# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
ActionController::Base.class_eval do
  protected
    def authenticate_with_open_id(identity_url = nil, options = {}, &block) #:doc:
    end 
end

# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'

# Comment out the next line if you want Rails' own error handling
# (e.g. rescue_action_in_public / rescue_responses / rescue_from)
Cucumber::Rails.bypass_rescue

require 'webrat'
require 'cucumber/webrat/element_locator' # Lets you do table.diff!(element_at('#my_table_or_dl_or_ul_or_ol').to_table)

Webrat.configure do |config|
  config.mode = :rails
end

require 'webrat/core/matchers'
Dir.glob(File.join(File.dirname(__FILE__), '../../features/factories/*.rb')).each {|f| require f }


ActionController::Base.class_eval do
  protected
    def authenticate_with_open_id(identity_url = nil, options = {}, &block) #:doc:
    end 
end

