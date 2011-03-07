require 'correspondence'

module Correspondence
  module With
    extend ActiveSupport::Concern
    extend ActiveSupport::Autoload

    autoload :ManyProxy
    autoload :OneProxy
    autoload :Proxy
    
    module ClassMethods
      def corresponds_with(association, options={}, &block)
        type = plural_association?(association) ? 'Many' : 'One'
        correspondences[association.to_sym] = const_get("#{type}Proxy").new(self, association, options)
      end

      def correspondences
        @correspondences ||= Hash.new
      end

      private

        def plural_association?(association)
          association.to_s.pluralize == association.to_s
        end
    end
  end
end
