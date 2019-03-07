require 'pry'

def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |hash|
    hash.each do |item, info|
      if !consolidated_cart[item]
        consolidated_cart[item] = info
        consolidated_cart[item][:count] = 1
      else
        consolidated_cart[item][:count] += 1
      end
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
# code here
end

def apply_clearance(cart)
  cart.each do |hash, item|
    if item[:clearance]
      new_price = item[:price] * 0.80
      item[:price] = new_price.round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end
