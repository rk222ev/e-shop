require "checkout_policy"

class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.shipping_address = Address.new
  end

  def create
    @order = CheckoutPolicy.checkout(shipping: Address.new(address_params),
                                     items: Cart.items)
    redirect_to root_path
  end

  def address_params
    params.require(:order).require(:address)
                          .permit(:firstname,
                                  :lastname,
                                  :street,
                                  :city,
                                  :postal_code)
  end
end
