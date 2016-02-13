require "order_status_policy"

class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 50)
  end

  def show
    @order = Order.includes(order_rows: [:product]).find(params[:id])
  end

  def edit
    @order = Order.includes(order_rows: [:product]).find(params[:id])
  end

  def update
    @order = Order.includes(:shipping_address).find(params[:id])
    @order.assign_attributes(params.require(:order).permit(:status))
    @order.billing_address.assign_attributes(billing_address_params)
    @order.shipping_address.assign_attributes(shipping_address_params)

    OrderStatusPolicy.complete? @order

    if @order.save
      flash.now[:success] = t ".success"
    end
  rescue OrderStatusPolicy::NotCompleteError
    flash.now[:error] = t ".order_not_complete"
  end

  def destroy
    Order.find(params.require(:id)).destroy
    redirect_to admin_orders_path
  end

  def billing_address_params
    params.require(:order)
          .require(:billing_address)
          .permit(:firstname, :lastname, :street, :postal_code, :city)
  end

  def shipping_address_params
    params.require(:order)
          .require(:shipping_address)
          .permit(:firstname, :lastname, :street, :postal_code, :city)
  end
end
