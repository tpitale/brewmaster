require 'bundler/setup'

require 'rspec'

require File.expand_path('../../lib/brewmaster', __FILE__)

# Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # config.mock_with :mocha
end
