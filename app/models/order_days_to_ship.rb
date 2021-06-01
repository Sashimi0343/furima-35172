class OrderDaysToShip
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address,
                :building, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :order_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'Please choose an option.' }

end