module DcAddressLookup
  class Location
    def self.from_table(table)
      location = self.new
      return location unless table

      table.each do |key,value|
        key = key.downcase

        if value.class == String
          value = value.gsub(/\A#{key.split("_").first}\b/i, "").squeeze("\s").strip
          value = value.to_i if value =~ /\A[1-9][0-9]*\z/
          value = value.to_f if value =~ /\A[0-9]+\.[0-9]+\z/
        elsif value.class == Float
          value = value.to_i if value.to_s =~ /\A[0-9]+\.0\z/
        end

        location.data[key] = value
      end

      location
    end

    def valid?
      !(data.empty?)
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
