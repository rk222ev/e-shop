class OrdersController < ApplicationController
  def new
  end

  def create
    CheckoutPolicy.checkout(Cart.items)
    redirect_to root_path
  end
end
