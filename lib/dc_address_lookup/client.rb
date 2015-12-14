module DcAddressLookup
  class Client
    def lookup(query)
      Query.new(query).response.location
    end
  end
end
