FactoryBot.define do
  factory :user do
    nickname                     { Faker::Name.initials(number: 4) }
    email                        { Faker::Internet.free_email }
    password                     { 'test100' }
    password_confirmation        { password }
    first_name                   { Gimei.first.kanji }
    last_name                    { Gimei.last.kanji }
    first_name_kana              { Gimei.first.katakana }
    last_name_kana               { Gimei.last.katakana }
    birthday                     { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
