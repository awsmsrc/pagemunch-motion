module Pagemunch
  module Configurable
    class << self
      def self.keys
        [:key, :version]
      end

      attr_accessor *keys

      def self.configure
        yield Pagemunch::Configurable
        self
      end

      def self.configuration
        Hash[Pagemunch::Configurable.keys.map{|key| [key, Pagemunch::Configurable.instance_variable_get(:"@#{key}")]}]
      end
    end
  end
  include Configurable
end

