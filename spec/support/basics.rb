class Foo ; end
class Bar ; end
class Box ; end
class Baz ; end

[Foo, Bar, Box, Baz].each {|c| c.send(:include, Correspondence::With)}

