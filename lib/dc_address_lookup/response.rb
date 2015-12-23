module DcAddressLookup
  class Response

    attr_reader :body

    def initialize(body)
      @body = body
    end

    def location
      @location ||= Location.from_table(table)
    end

    private

    def parsed
      @parsed ||= JSON.parse(body)
    end

    def table
      parsed["returnDataset"]["Table1"].first if parsed["returnDataset"]
    end
  end
end
