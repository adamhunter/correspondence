require 'correspondence'

module Correspondence
  module With
    extend ActiveSupport::Concern
    extend ActiveSupport::Autoload

    autoload :ManyProxy
    autoload :OneProxy
    
    module ClassMethods
      def corresponds_with(association, options={}, &block)
        correspondences[association.to_sym] = if plural_association?(association)
          Correspondence::With::ManyProxy.new(options)
        else
          Correspondence::With::OneProxy.new(options)
        end
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
