class Admin::OrderRowsController < ApplicationController
  def update
    @order = Order.find(params.require(:order_id))
    @row = OrderRow.includes(:product).find(params.require(:id))
    if mark_as_sent?
      @row.update(sent: true)
    else
      adjust_quantity
    end
  rescue OrderService::OutOfStockError
    flash.now[:error] = t(".out_of_stock")
    render "out_of_stock"
  end

  def destroy
    @id = params.require(:id)
    OrderRow.find(@id).destroy
  end

  private

  def adjust_quantity
    quantity = params.require(:quantity).to_i
    OrderService.adjust_row_quantity(@row, quantity)
  end

  def mark_as_sent?
    params[:status].present?
  end
end
