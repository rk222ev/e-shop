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
    @order = Order.includes(:billing_address,
                            :shipping_address,
                            :order_rows).find(params[:id])

    params[:sent] ? mark_as_sent : update_order
    check_for_completion
  end

  def destroy
    Order.find(params.require(:id)).destroy
    redirect_to admin_orders_path
  end

  private

  def address_params(type)
    params.require(:order)
          .require(type)
          .permit(:firstname, :lastname, :street, :postal_code, :city)
  end

  def check_for_completion
    OrderStatusPolicy.complete? @order
    flash.now[:success] = t ".success" if @order.save
  rescue OrderStatusPolicy::NotCompleteError
    flash.now[:error] = t ".order_not_complete"
  end

  def mark_as_sent
    @order.order_rows.each { |r| r.sent = true }
    @order.status = 4
  end

  def update_order
    @order.assign_attributes(params.require(:order).permit(:status))
    @order.billing_address.assign_attributes(address_params(:billing_address))
    @order.shipping_address.assign_attributes(address_params(:shipping_address))
  end
end
