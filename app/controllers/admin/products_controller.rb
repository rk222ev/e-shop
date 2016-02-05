class Admin::ProductsController < Admin::AdminController
  before_action :assign_product, only: [:show, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render :show
    else
      flash[:notice] = t(".failed")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @product.destroy
      flash[:notice] = t(".success")
      redirect_to admin_products_path
    else
      redirect_to admin_product_path(@product)
      flash[:notice] = t(".failed")
    end
  end

  private

  def assign_product
    @product = Product.find(params.require(:id))
  end

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description)
  end

end
