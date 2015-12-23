$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dc_address_lookup'
require 'webmock/rspec'

WebMock.disable_net_connect!

TEST_ADDRESS = "1600 Pennsylvania Ave NW"

def fixture(file="white-house")
  path = File.expand_path "fixtures/#{file}.json", File.dirname(__FILE__)
  File.open(path).read
end
