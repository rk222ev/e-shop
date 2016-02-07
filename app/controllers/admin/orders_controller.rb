class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 50)
  end
end
