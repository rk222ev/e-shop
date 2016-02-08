class Address < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true

  def fullname
    [firstname, lastname].join(" ")
  end
end
