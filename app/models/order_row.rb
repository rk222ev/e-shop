class OrderRow < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, autosave: true

  def increase_quantity(n)
    self.quantity += n
    save
  end

  def decrease_quantity(n)
    self.quantity -= n
    save
  end
end
