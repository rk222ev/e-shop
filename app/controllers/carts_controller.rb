class CartsController < ApplicationController
  def show
    prepare_cart
  end

  def update
    adjust_cart
    prepare_cart
    @items_in_cart = CartService.count

    respond_to do |format|
      format.html do
        flash[:notice] = t ".success"
        redirect_to cart_path
      end

      format.js {}
    end
  end

  def destroy
    CartService.remove_product(product)

    respond_to do |format|
      format.html do
        flash[:notice] = t ".success"
        redirect_to cart_path
      end

      format.js {}
    end
  end

  def checkout
    OrderService.checkout(CartService.items)
  end

  private

  def adjust_cart
    if params["decrease"].present?
      CartService.remove_product(product)
    else
      CartService.add_product(product)
    end
  end

  def prepare_cart
    @items = CartService.items
    @total = CartService.total
  end

  def product
    @product = Product.find(params.require(:id))
  end
end
