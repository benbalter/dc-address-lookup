module DcAddressLookup
  class Client
    def lookup(query)
      response = RestClient.get DcAddressLookup::ENDPOINT, { params: { str: query } }
      Response.new(response).location
    end
  end
end
