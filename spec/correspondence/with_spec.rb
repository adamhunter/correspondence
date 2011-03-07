require 'spec_helper'

describe Correspondence::With do
  
  before :each do
    class Foo ; end
    class Bar ; end
    class Box ; end
    [Foo, Bar, Box].each {|c| c.send(:include, Correspondence::With)}
  end

  describe "creating an association" do
    it "should instantiate a one association when corresponding with a singular symbol" do
      Foo.corresponds_with :bar
      Foo.correspondences[:bar].should be_a(Correspondence::With::OneProxy)
    end

    it "should instantiate a many association when corresponding with a plural symbol" do
      Bar.corresponds_with :boxes
      Bar.correspondences[:boxes].should be_a(Correspondence::With::ManyProxy)
    end

    it "should create an assocation with the associated class" do
      pending 'refactoring'
      Person.stub!(:find).with(1).and_return(@person = mock('Person', :id => 1))
      @user = User.new
      @user.id = 1
      @user.person.should eq(@person)
    end

    it "should assume the classname is a constantized association name"
    it "should allow specifiying the :class_name"
    it "should assume the default finder method is :find"
    it "should allow specifiying the :finder_method"
    it "should assume the default correspondence method is :id"
    it "should allow specifiying the method to use to correspond to the associated object"
  end

end
