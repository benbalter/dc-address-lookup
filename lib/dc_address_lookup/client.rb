module DcAddressLookup
  class Client
    def lookup(query)
      response = RestClient.get DcAddressLookup::ENDPOINT, { params: { str: query } }
      location = Response.new(response).location
      location if location.valid?
    end
  end
end
