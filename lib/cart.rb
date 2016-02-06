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

  def self.count
    store&.count || 0
  end

  private

  def self.store
    @config.store[:cart] ||= []
  end

end
