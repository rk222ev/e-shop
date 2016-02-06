class CartsController < ApplicationController
  def show
    @items = Cart.items
    @total = Cart.total
  end

  def update
    Cart.add_product(product)

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

  private

  def product
    @product = Product.find(params.require(:id))
  end
end
