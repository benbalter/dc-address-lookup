require 'nokogiri'
require 'typhoeus'
require 'addressable/uri'
require "addressable/template"
require "dc_address_lookup/version"
require "dc_address_lookup/client"
require "dc_address_lookup/query"
require "dc_address_lookup/response"
require "dc_address_lookup/location"

module DcAddressLookup
  ENDPOINT = "http://citizenatlas.dc.gov/newwebservices/locationverifier.asmx/findLocation"
  QUERY_TEMPLATE = Addressable::Template.new "#{ENDPOINT}{?query*}"
  TYPHOEUS_OPTIONS = {
    accept_encoding: "gzip",
    headers: {
      "User-Agent" => "Mozilla/5.0 (compatible; dc-address-lookup/#{DcAddressLookup::VERSION}; +https://github.com/benbalter/dc-address-lookup)"
    }
  }

  def self.lookup(address)
    Client.new.lookup(address)
  end
end
