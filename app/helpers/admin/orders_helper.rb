module Admin::OrdersHelper
  def order_statuses
    %w(new paused ready sent finished)
  end

  def status_for(n)
    return order_statuses[n]
  end
end
