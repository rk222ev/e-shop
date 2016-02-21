class Admin::ProductsController < Admin::BaseController
  before_action :assign_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 50)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product)
      flash[:success] = t ".success"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = t ".success"
      redirect_to admin_product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t(".success")
      redirect_to admin_products_path
    else
      flash[:notice] = t(".failed")
      redirect_to admin_product_path(@product)
    end
  end

  private

  def assign_product
    @product = Product.find(params.require(:id))
  end

  def product_params
    params.require(:product).permit(:name,
                                    :price,
                                    :quantity,
                                    :description,
                                    :picture)
  end
end
