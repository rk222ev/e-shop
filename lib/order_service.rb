module OrderService
  def self.checkout(shipping:, cart:, billing: nil)
    order = Order.new
    order.shipping_address = shipping

    cart.items.each do |i|
      # TODO Improve
      p = cart.products.select { |p| p.id == i[:product].id }
      p.first.quantity -= i[:quantity]
      p.first.save

      order.order_rows.new(product_id:    i[:product].id,
                           price_at_sale: i[:product].price,
                           quantity:      i[:quantity])
    end

    order
  end
end
