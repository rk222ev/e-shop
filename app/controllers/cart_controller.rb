class CartController < ApplicationController
  def show
    @cart = session[:cart]
  end
end

