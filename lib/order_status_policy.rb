module OrderStatusPolicy
  class NotCompleteError < StandardError; end

  def self.complete?(order)
    return if order.status != 4
    order.order_rows.each do |row|
      fail NotCompleteError unless row.sent
    end
  end
end
