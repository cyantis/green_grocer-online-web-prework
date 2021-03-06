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
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[name][:clearance], :count => 1}
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, info|
    if info[:clearance]
      new_price = info[:price] * 0.80
      info[:price] = new_price.round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  final_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(final_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  total = 0
  clearance_cart.each {|name, info| total += info[:price] * info[:count]}
  total *= 0.90 if total > 100.00
  total
end
