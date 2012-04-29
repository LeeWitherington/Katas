require 'discounter'

class Checkout

  def initialize discounter, price_changed_listener
    @catalogue = {'A'=> 50, 'B' => 30, 'C' => 20, 'D' => 15}
    @items = {}
    @discounter = discounter
    @price_changed_listener = price_changed_listener
    @price_changed_listener.price_changed 0
  end

  def scan sku
    @items[sku] = 0 if @items[sku].nil?
    @items[sku] += 1 
    @price_changed_listener.price_changed total
  end

  private
  
  def total
    running_total = 0
    @items.each{|sku, quantity|
      running_total += get_price sku, quantity
      running_total -= @discounter.get_discount sku, quantity
    }
    running_total
  end
  
  def get_price sku, quantity
    @catalogue[sku] * quantity
  end
  
end
