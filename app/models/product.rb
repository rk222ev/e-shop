class Product < ActiveRecord::Base
  include Paperclip::Glue

  default_scope { order('id ASC') }
  has_attached_file :picture, styles: { thumb: "400x250>" }, default_url: ":style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
