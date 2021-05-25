class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :days_to_ship, :delivery_charge, :prefecture, :status


  with_options presence: true do
    validates :title
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates_inclusion_of :price, in:300..9999999, message: "Please enter 300 〜 9,999,999 & half-width numbers"
    validates :image


    with_options numericality: { other_than: 0, message: 'Please choose an option.' } do
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
