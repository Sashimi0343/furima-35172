class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user.id != @item.user.id || @item.order != nil
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id, :status_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
