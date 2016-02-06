class CartsController < ApplicationController
  def show
    @products = Cart.products
  end

  def update
    Cart.add_product(Product.find(params.require(:id)))

    respond_to do |format|
      format.html do
        flash[:notice] = t (".success")
        redirect_to cart_path
      end

      format.js { }
    end
  end
end
