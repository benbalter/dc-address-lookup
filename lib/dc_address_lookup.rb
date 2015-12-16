require 'nokogiri'
require 'rest-client'
require 'restclient/components'
require 'rack/cache'

require "dc_address_lookup/version"
require "dc_address_lookup/client"
require "dc_address_lookup/response"
require "dc_address_lookup/location"

RestClient.enable Rack::Cache

module DcAddressLookup
  ENDPOINT = "http://citizenatlas.dc.gov/newwebservices/locationverifier.asmx/findLocation"

  def self.lookup(address)
    Client.new.lookup(address)
  end
end
