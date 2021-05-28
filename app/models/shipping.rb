class Shipping < ApplicationRecord

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number

    validates :prefecture_id, numericality: { other_than: 0, message: 'Please choose an option.' }
  end


  belongs_to :order
end
