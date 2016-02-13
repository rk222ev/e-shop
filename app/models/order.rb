class Order < ActiveRecord::Base
  has_many :order_rows, dependent: :destroy

  belongs_to :billing_address, class_name: "Address",
                               dependent: :destroy,
                               autosave:true

  belongs_to :shipping_address, class_name: "Address",
                                dependent: :destroy,
                                autosave:true
end
