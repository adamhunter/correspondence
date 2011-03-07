require 'spec_helper'

describe Correspondence::With::Proxy do

  it "should assume the target is association name" do
    proxy = TestProxy.new(Bar, :foo, {})
    proxy.target.should eq(Foo) 
  end

  it "should allow specifiying the target's class_name" do
    proxy = TestProxy.new(Bar, :foo, {:class_name => 'Box'})
    proxy.target.should eq(Box)
  end

  it "should allow specifiying the target's class" do
    proxy = TestProxy.new(Bar, :foo, {:class => Foo})
    proxy.target.should eq(Foo)
  end

  it "should allow using a string to specify the target's class" do
    proxy = TestProxy.new(Bar, :foo, {:class => 'Foo'})
    proxy.target.should eq(Foo)
  end

  it "should allow using a proc to specify the target's class" do
    proxy = TestProxy.new(Bar, :foo, {:class => proc { Foo }})
    proxy.target.should eq(Foo)
  end

  it "should allow passing a symbol to reference a method to determine the target's class" do
    proxy = TestProxy.new(Bar, :foo, {:class => :foo_class_name})
    proxy.target.should eq(Foo)
  end

end

