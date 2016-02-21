class OrdersController < ApplicationController
  def new
    redirect_to cart_path, notice: t(".failure") if @items_in_cart < 1
    @order = Order.new
    @order.billing_address = Address.new
    @order.shipping_address = Address.new
  end

  def create
    billing = Address.new(address_params(:billing_address))
    shipping = Address.new(address_params(:shipping_address))

    @order = OrderService.checkout(billing: billing,
                                   cart: CartService,
                                   shipping: shipping)
    if @order.save
      CartService.destroy
      flash[:success] = t ".success"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def address_params(type)
    params.require(:order)
          .require(type)
          .permit(:firstname,
                  :lastname,
                  :street,
                  :city,
                  :postal_code)
  end
end
