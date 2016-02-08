class Admin::OrderRowsController < ApplicationController
  def update
    @order = Order.find(params.require(:order_id))
    @row = OrderRow.includes(:product).find(params.require(:id))

    @row.quantity += params.require(:quantity).to_i
    @row.save
  end

  def destroy
    @id = params.require(:id)
    OrderRow.find(@id).destroy
  end
end
