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
    proxy = TestProxy.new(Bar, :foo, {:class => Baz})
    proxy.target.should eq(Baz)
  end

end

