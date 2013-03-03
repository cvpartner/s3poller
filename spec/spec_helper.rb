$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 's3poller'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 's3poller'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

AWS_CONFIG = YAML::load(File.open("#{File.dirname(__FILE__)}/integration_config/aws.yml"))

RSpec.configure do |config|
  
end
