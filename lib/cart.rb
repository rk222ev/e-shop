module Cart
  class Configuration
    attr_accessor :store
  end

  def self.configure
    @config = Configuration.new
    yield @config
  end

  def self.products
    return unless store
    Product.find(store)
  end

  def self.add_product(product)
    store << product.id
  end

  def self.remove_product(product)
    return if store.empty?
    temp = store
    store.delete_at(store.find_index(product.id))
  end

  def self.product_quantity(product_id)
    store.count(product_id)
  end

  def self.items
    products.each_with_object([]) do |p, collection|
      item = {}.tap do |i|
        i[:product] = p
        i[:quantity] = Cart.product_quantity(p.id)
        i[:total] = p.price * i[:quantity]
      end
      collection << item
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

  private

  def self.store
    @config.store[:cart] ||= []
  end

end
