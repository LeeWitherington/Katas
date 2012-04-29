class Discounter

  def get_discount sku, quantity
    return (quantity /  3) * 30 if sku == "A"
    return (quantity /  2) * 15 if sku == "B"
    0
  end

end
