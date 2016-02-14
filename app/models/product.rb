class Product < ActiveRecord::Base
  include Paperclip::Glue

  default_scope { order id: :asc }

  has_attached_file :picture, styles: { thumb: "400x250>" }, default_url: ":style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  def increase_quantity(n)
    self.quantity += n
    save
  end

  def decrease_quantity(n)
    self.quantity -= n
    save
  end
end
