FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '市区町村' }
    address { ' 番地 ' }
    building { ' 建物 ' }
    phone_number { '08012345678' }
    token { ENV['PAYJP_PUBLIC_KEY'] }
  end
end
