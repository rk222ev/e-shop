require "order_service"

class Admin::OrderRowsController < ApplicationController
  def update
    quantity = params.require(:quantity).to_i
    @order = Order.find(params.require(:order_id))
    @row = OrderRow.includes(:product).find(params.require(:id))

    OrderService.adjust_row_quantity(@row, quantity)

  rescue OrderService::OutOfStockError
    flash.now[:error] = t (".out_of_stock")
    render "out_of_stock"
  end

  def destroy
    @id = params.require(:id)
    OrderRow.find(@id).destroy
  end
end
