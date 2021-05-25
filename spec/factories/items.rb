FactoryBot.define do
  factory :item do
    title                 { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    price                 { '10000' }
    category_id           { 1 }
    status_id             { 1 }
    delivery_charge_id    { 1 }
    prefecture_id         { 1 }
    days_to_ship_id       { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
