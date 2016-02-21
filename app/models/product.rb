class Product < ActiveRecord::Base
  include Paperclip::Glue

  scope :by_id,     -> { order(id: :asc) }
  scope :availible, -> { by_id.where("quantity > 0") }

  has_attached_file :picture,
                    styles: { thumb: "400x250>" },
                    default_url: ":style/missing.png"
  validates_attachment_content_type :picture,
                                    content_type: %r{/\Aimage\/.*\Z/},
                                    if: -> { picture.content_type.blank? }

  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  def increase_quantity(n)
    self.quantity += n
    save
  end

  def decrease_quantity(n)
    self.quantity -= n
    save
  end
end
