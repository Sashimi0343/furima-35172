FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '川口市石神' }
    address { ' 977-1 ' }
    building { ' アムール新町102 ' }
    phone_number { '08054864124' }
    token { ENV['PAYJP_PUBLIC_KEY'] }
  end
end
