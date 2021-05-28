class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title, :description, :image

    validates :price, numericality: { only_integer: true, message: 'Please enter half-width numbers' }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'Please enter 300 〜 9,999,999'

    with_options numericality: { other_than: 0, message: 'Please choose an option.' } do
      validates :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id
    end
  end

  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :status


  has_one :order
  has_one_attached :image
  belongs_to :user
end
