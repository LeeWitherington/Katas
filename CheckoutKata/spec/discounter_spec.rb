require 'rspec'
require 'discounter'

describe Discounter do

  it "should return 0 for 2 * A" do
    d = Discounter.new
    d.get_discount("A", 2).should == 0
  end

  it "should return 30 for 3 * A" do
    d = Discounter.new
    d.get_discount("A", 3).should == 30
  end

  it "should return 15 for 2 * B" do
    d = Discounter.new
    d.get_discount("B", 2).should == 15
  end

  it "should return 60 for 6 * A" do
    d = Discounter.new
    d.get_discount("A", 6).should == 60
  end

end
