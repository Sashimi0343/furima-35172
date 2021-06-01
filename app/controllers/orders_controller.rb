class OrdersController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :municipality, :address, :building,
                                           :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end

end
