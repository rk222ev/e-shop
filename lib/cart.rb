module Cart
  class Configuration
    attr_accessor :store
  end

  def self.configure
    @config = Configuration.new
    yield @config
  end

  def self.products
    Product.find(@config.store)
  end

  def self.add_product(product)
    @config.store << product.id
  end

  def self.count
    @config.store.count
  end

end
