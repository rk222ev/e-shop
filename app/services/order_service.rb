module OrderService
  class OutOfStockError < RangeError; end

  def self.checkout(billing:, cart:, shipping:)
    order = new_order(billing, shipping)
    cart.items.each_with_object(order) do |item, o|
      prod = cart.products.select { |p| p.id == item[:product].id }
      prod.first.decrease_quantity(item[:quantity])
      o.order_rows.new(row_params(item))
    end
  end

  def self.adjust_row_quantity(row, quantity)
    fail OutOfStockError if row.product.quantity < quantity
    row.product.decrease_quantity(quantity)
    row.increase_quantity(quantity)
  end

  class << self
    private

    def new_order(billing, shipping)
      Order.new.tap do |o|
        o.billing_address = billing
        o.shipping_address = shipping
      end
    end

    def row_params(item)
      { product_id:    item[:product].id,
        price_at_sale: item[:product].price,
        quantity:      item[:quantity] }
    end
  end
end
