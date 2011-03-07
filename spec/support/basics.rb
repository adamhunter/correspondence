class Bar
  def self.foo_class_name; Foo; end
end

class Foo ; end
class Box ; end
class Baz ; end

[Foo, Bar, Box, Baz].each {|c| c.send(:include, Correspondence::With)}

