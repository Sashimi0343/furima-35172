FactoryBot.define do
  factory :user do

    nickname                     {Faker::Name.initials(number: 4)}
    email                        {Faker::Internet.free_email}
    password                     {Faker::Internet.password(min_length: 6)}
    password_confirmation        {password}
    first_name                   {gimei.first.kanji}
    last_name                    {gimei.last.kanji}
    first_name_kana              {gimei.first.katakana}
    last_name_kana               {gimei.last.katakana}
    birthday                     {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
