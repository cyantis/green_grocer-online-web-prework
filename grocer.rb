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
    cart.each do |item, info|
      if item == coupons[0][:item]
        cart["#{item} W/COUPON"] = {:price => coupons[0][:price], :clearance => info[:clearance], :count => 1}
        cart[item][:count] -= coupons[0][:count]
      end
      cart.delete(item) if cart[item][:count] == 0
    end
end

def apply_clearance(cart)
  cart.each do |item, info|
    if info[:clearance]
      new_price = info[:price] * 0.80
      info[:price] = new_price.round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end
