module Ym4r
  module GmPlugin
    class GMapsAPIKeyConfigFileNotFoundException < StandardError
    end
        
    class AmbiguousGMapsAPIKeyException < StandardError
    end
    
    #Class fo the manipulation of the API key
    class ApiKey
      # GMAPS_API_KEY is now loaded in the railtie to be able to use Rails.root.

      def self.get(options = {})
        if options.has_key?(:key)
          options[:key]
        elsif GMAPS_API_KEY.is_a?(Hash)
          #For this environment, multiple hosts are possible.
          #:host must have been passed as option
          if options.has_key?(:host)
            GMAPS_API_KEY[options[:host]]
          else
            raise AmbiguousGMapsAPIKeyException.new(GMAPS_API_KEY.keys.join(","))
          end
        else
          #Only one possible key: take it and ignore the :host option if it is there
          GMAPS_API_KEY
        end
      end
    end
  end
end
