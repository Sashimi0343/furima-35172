class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :check_user, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if (current_user.id != @item.user.id)
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def check_user
    @item = current_user.items.find_by(id: params[:id])
      unless @item
        redirect_to root_path
      end
  end


  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id, :status_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
