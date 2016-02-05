class Admin::ProductsController < Admin::AdminController
  def index
  end

  def new
    @product = Product.new
  end

end
