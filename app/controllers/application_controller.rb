require "cart"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_action :cart

  def cart
    session[:cart] ||= []

    Cart.configure do |config|
      config.store = session[:cart]
    end

    @items_in_cart = Cart.count
  end
end
