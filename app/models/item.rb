class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :days_to_ship, :delivery_charge, :prefecture, :status


  with_options presence: true do
    validates :title
    validates :description
    validates :price
    validates :image

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  belongs_to :user
  has_one_attached :image
end
