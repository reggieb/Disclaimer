# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

class ActiveSupport::TestCase
  fixtures :all
end

class ActionController::TestCase
  
  #Overrides get, post etc. to use a default :use_route of :disclaimer
  def process(action, parameters, session = nil, flash = nil, http_method = 'GET')
    parameters ||= Hash.new
    parameters[:use_route] = :disclaimer unless parameters[:use_route]
    super
  end
  
end


