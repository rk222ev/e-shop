class OrderRow < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, autosave: true


end
