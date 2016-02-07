class Order < ActiveRecord::Base
  has_many :order_rows
  belongs_to :shipping_address, class_name: "Address"

  validates_associated :shipping_address
end
