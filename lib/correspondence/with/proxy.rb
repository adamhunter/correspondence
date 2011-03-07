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
          @options[:class] = @options[:class_name] if @options[:class_name]

          if @options[:class].is_a?(Class)
            @options[:class]
          elsif @options[:class].is_a?(String)
            @options[:class].constantize
          elsif @options[:class].is_a?(Symbol)
            root.send(@options[:class])
          elsif @options[:class].respond_to?(:call)
            @options[:class].call
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
