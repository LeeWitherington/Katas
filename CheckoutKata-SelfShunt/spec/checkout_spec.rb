require 'rspec'
require 'checkout'
require 'discounter'

describe Checkout do

  it "should return 0 when no items scanned" do
   get_total("").should == 0
  end

  it "should return 50 when A scanned" do
    get_total("A").should == 50
  end

  it "should return 30 when B scanned" do
    get_total("B").should == 30
  end

  it "should return 20 when C scanned" do
    get_total("C").should == 20
  end

  it "should return 15 when D scanned" do
    get_total("D").should == 15
  end
  
  it "should return 80 when AB scanned" do
    get_total("AB").should == 80
  end

  it "should return 130 when AAB scanned" do
    get_total("AAB").should == 130
  end
  
  it "should return 120 when AAA scanned" do
    get_total("AAA").should == 120
  end
 
  it "should return 165 when AAABB scanned" do
    get_total("AAABB").should == 165
  end

  def get_total items
    c = Checkout.new(Discounter.new, self)
    items.each_char{|sku|
      c.scan sku
    }
    @last_price
  end

  def price_changed price
    @last_price = price
  end
end
