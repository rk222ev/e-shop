class Order < ActiveRecord::Base
  has_many :order_rows, dependent: :destroy
  belongs_to :shipping_address, class_name: "Address", dependent: :destroy

  validates_associated :shipping_address
end
