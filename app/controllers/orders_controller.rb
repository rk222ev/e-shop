require "checkout_policy"

class OrdersController < ApplicationController
  def new
    redirect_to cart_path, notice: t(".failure") if @items_in_cart < 1
    @order = Order.new
    @order.shipping_address = Address.new
  end

  def create
    @order = CheckoutPolicy.checkout(shipping: Address.new(address_params),
                                     items: Cart.items)
    if @order.save
      Cart.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  def address_params
    params.require(:order)
          .require(:address)
          .permit(:firstname,
                  :lastname,
                  :street,
                  :city,
                  :postal_code)
  end
end
