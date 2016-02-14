module OrderService
  class OutOfStockError < RangeError; end

  def self.checkout(billing:, cart:, shipping:)
    order = Order.new
    order.billing_address = billing
    order.shipping_address = shipping

    cart.items.each do |i|
      p = cart.products.select { |p| p.id == i[:product].id }
      p.decrease_quantity(i[:quantity])

      order.order_rows.new(product_id:    i[:product].id,
                           price_at_sale: i[:product].price,
                           quantity:      i[:quantity])
    end

    order
  end

  def self.adjust_row_quantity(row, quantity)
    raise OutOfStockError if row.product.quantity < quantity
    row.product.decrease_quantity(quantity)
    row.quantity += quantity
    row.save
  end
end
