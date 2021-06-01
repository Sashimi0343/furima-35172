class OrdersController < ApplicationController

  def index
    @order = Order.new
    @Shipping = Shipping.new
  end

  def create
  end
end
