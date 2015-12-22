module DcAddressLookup
  class Client
    def lookup(query)
      params = { f: "json", str: query } 
      response = RestClient.get DcAddressLookup::ENDPOINT, { params: params }
      location = Response.new(response).location
      location if location.valid?
    end
  end
end
