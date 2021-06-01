class OrderShipping
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

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                    address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end