module Correspondence
  module With
    class Proxy
      attr_reader :root, :name, :target

      def initialize(root, name, options)
        @root    = root
        @name    = name.to_sym
        @options = options
        @target  = set_target
        @options[:on]    ||= :id
        @options[:using] ||= :find
        create_association
      end

      protected
        def set_target
          if @options[:class_name]
            @options[:class_name].constantize
          elsif @options[:class]
            @options[:class]
          else
            @name.to_s.classify.constantize
          end
        end

        def create_association
          raise NotImplementedError
        end

    end
  end
end
