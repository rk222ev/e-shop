module CheckoutPolicy
  def self.checkout(items)

    # Validate data
    # Create order
    # Create rows ensuring that stock can match the quantity
    # Place order

    # Raise order error matching the thing that went wrong

    order = Order.new

    items.each do |i|
      order.order_rows.new(product_id:    i[:product].id,
                           price_at_sale: i[:product].price,
                           quantity:      i[:quantity])
    end

    order.save!
  end
end
