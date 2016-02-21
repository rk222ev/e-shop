class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
