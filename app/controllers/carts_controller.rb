class CartsController < ApplicationController
  def show
    @items = Cart.items
    @total = Cart.total
  end

  def update
    if params["remove-product"].present?
       Cart.remove_product(product)
     else
       Cart.add_product(product)
     end

    respond_to do |format|
      format.html do
        flash[:notice] = t (".success")
        redirect_to cart_path
      end

      format.js { }
    end
  end

  def patch
  end

  def destroy
    Cart.remove_product(product)

    respond_to do |format|
      format.html do
        flash[:notice] = t (".success")
        redirect_to cart_path
      end

      format.js { }
    end
  end

  private

  def product
    @product = Product.find(params.require(:id))
  end
end
