module Correspondence
  module With
    class OneProxy < Proxy

      protected
        def create_association
          root.class_eval <<-RB
            def #{name}
              #{@target}.#{@options[:using]}(#{@options[:on]})
            end
          RB
        end
    end
  end
end
