require 'rest-client'
require 'restclient/components'
require 'rack/cache'
require 'json'

require "dc_address_lookup/version"
require "dc_address_lookup/client"
require "dc_address_lookup/response"
require "dc_address_lookup/location"

module DcAddressLookup
  DOMAIN = "http://citizenatlas.dc.gov"
  ENDPOINT = "#{DOMAIN}/newwebservices/locationverifier.asmx/findLocation2"

  def self.lookup(address)
    Client.new.lookup(address)
  end
end
