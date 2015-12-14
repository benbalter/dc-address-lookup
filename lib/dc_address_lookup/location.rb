module DcAddressLookup
  class Location
    def self.from_table(xml)
      location = self.new

      xml.children.each do |node|
        next if node.node_name == "text"
        key = node.name.downcase
        value = node.text.gsub(/\A#{key.split("_").first}\b/i, "").squeeze("\s").strip
        value = value.to_i if value.to_i.to_s == value
        value = value.to_f if value.to_f.to_s == value
        location.data[key] = value
      end

      location
    end

    def method_missing(method_sym, *arguments, &block)
      if has_property?(method_sym)
       data[method_sym.to_s]
      else
       super
      end
    end

    def respond_to?(method_sym, include_private = false)
      if has_property?(method_sym)
        true
      else
        super
      end
    end

    def data
      @data ||= {}
    end

    private

    def has_property?(property)
      data.keys.include?(property.to_s)
    end
  end
end
