class ProductsController < ApplicationController
  def index
    @products = Product.availible
                       .paginate(page: params[:page], per_page: 9)
  end

  def show
    @product = Product.find(params.require(:id))
  end
end
