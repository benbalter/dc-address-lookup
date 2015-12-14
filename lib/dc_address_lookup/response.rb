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

    def document
      doc ||= begin
        doc = Nokogiri::XML(body) { |config| config.strict.nonet }
        doc.remove_namespaces!
        doc
      end
    end

    def table
      document.xpath("ReturnObject//returnDataset//diffgram//NewDataSet//Table1")
    end
  end
end
