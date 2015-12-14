module DcAddressLookup
  class HttpError < StandardError; end

  class Query

    attr_reader :query

    def initialize(query)
      @query = query
    end

    def response
      raise HttpError unless raw_response.success?
      @response ||= Response.new(raw_response.body)
    end

    private

    def uri
      DcAddressLookup::QUERY_TEMPLATE.expand query: { str: query }
    end

    def raw_response
      @raw_response ||= Typhoeus.get uri, TYPHOEUS_OPTIONS
    end
  end
end
