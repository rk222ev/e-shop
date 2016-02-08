class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 50)
  end

  def show
    @order = Order.includes(order_rows: [:product]).find(params[:id])
  end

  def destroy
    Order.find(params.require(:id)).destroy
    redirect_to admin_orders_path
  end
end
