require 'spec_helper'

describe Correspondence::With::OneProxy do
  before :all do
    Bar.corresponds_with :foo
  end

  after :all do
    Bar.instance_variable_set(:@correspondences, {})
  end

  it "should add the associated method to the associating class" do
    Bar.new.should respond_to(:foo)
  end

end
