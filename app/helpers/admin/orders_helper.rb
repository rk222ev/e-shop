module Admin::OrdersHelper
  def order_statuses
    %w(new paused ready sent finished)
  end

  def number_of_statuses
    order_statuses.zip(0..order_statuses.count)
  end

  def status_for(n)
    return order_statuses[n]
  end
end
