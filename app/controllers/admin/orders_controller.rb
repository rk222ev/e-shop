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
    @order.shipping_address.assign_attributes(address_params)
    @order.save
  end

  def destroy
    Order.find(params.require(:id)).destroy
    redirect_to admin_orders_path
  end

  def address_params
    params.require(:order)
          .require(:address)
          .permit(:firstname, :lastname, :street, :postal_code, :city)
  end
end
