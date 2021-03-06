##
# Service module handling carts
#
# params:
#   store - Object to store an array or product ids
#   product  - The cartproduct object
#
# Example configuration:
#   CartService.configure do |config|
#     config.store = SOME_STORE
#     config.product = SOME_PRODUCT
#   end

module CartService
  class Configuration
    attr_accessor :store, :product
  end

  def self.configure
    @config = Configuration.new
    yield @config
  end

  def self.products
    @config.product.find(store) if store
  end

  def self.add_product(product)
    store << product.id
  end

  def self.remove_product(product)
    store.delete_at(store.find_index(product.id)) unless store.empty?
  end

  def self.product_quantity(product_id)
    store.count(product_id)
  end

  def self.items
    products.each_with_object([]) do |p, collection|
      collection << {}.tap do |i|
        i[:product] = p
        i[:quantity] = product_quantity(p.id)
        i[:total] = p.price * i[:quantity]
      end
    end
  end

  def self.total
    products.sum { |p| p.price * product_quantity(p.id) }
  end

  def self.count
    store&.count || 0
  end

  def self.destroy
    @config.store.delete(:cart)
  end

  def self.store
    @config.store[:cart] ||= []
  end
end
