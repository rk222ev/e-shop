module Admin::OrdersHelper
  def status_for(n)
    return %w(new paused ready sent finished)[n]
  end
end
