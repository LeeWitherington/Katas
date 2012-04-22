require 'discounter'

class Checkout

  def initialize discounter
    @catalogue = {'A'=> 50, 'B' => 30, 'C' => 20, 'D' => 15}
    @items = {}
    @discounter = discounter
  end

  def scan sku
    @items[sku] = 0 if @items[sku].nil?
    @items[sku] += 1 
  end

  def total
    running_total = 0
    @items.each{|sku, quantity|
      running_total += get_price sku, quantity
      running_total -= @discounter.get_discount sku, quantity
    }
    running_total
  end

  private
  
  def get_price sku, quantity
    @catalogue[sku] * quantity
  end
  
end
