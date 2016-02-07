class CartsController < ApplicationController
  def show
    prepare_cart
  end

  def update
    if params["remove-product"].present?
       Cart.remove_product(product)
     else
       Cart.add_product(product)
     end
    prepare_cart
    @items_in_cart = Cart.count

    respond_to do |format|
      format.html do
        flash[:notice] = t (".success")
        redirect_to cart_path
      end

      format.js { }
    end
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

  def checkout
  end

  private

  def prepare_cart
    @items = Cart.items
    @total = Cart.total
  end

  def product
    @product = Product.find(params.require(:id))
  end
end
