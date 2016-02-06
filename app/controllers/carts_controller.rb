class CartsController < ApplicationController
  def show
    @products = Cart.products
  end

  def update
<<<<<<< HEAD
    cart << Product.find(params.require(:id))
    flash[:notice] = t (".success")
=======
    Cart.add_product(Product.find(params.require(:id)))
>>>>>>> 76b12dd... Introduce cart

    redirect_to cart_path
  end
end
