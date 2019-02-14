require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Lightbox
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:options) { {} }

      def self.options_as_data_attributes
        @@options.each_with_object({}) { |(k, v), m| m["data-#{k.to_s.underscore.gsub('_', '-')}"] = v }
      end
    end
  end
end
