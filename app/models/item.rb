class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :description
    validates :price
    validates :category
    validates :status
    validates :delivery_charge
    validates :prefecture
    validates :days_to_ship
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
