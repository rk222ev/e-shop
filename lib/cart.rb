module Cart
  class Configuration
    attr_accessor :store
  end

  def self.configure
    @config = Configuration.new
    yield @config
  end

  def self.products
    store ?  Product.find(store) : []
  end

  def self.add_product(product)
    store << product.id
  end

  def self.count
    store&.count || 0
  end

  private

  def self.store
    @config.store
  end

end