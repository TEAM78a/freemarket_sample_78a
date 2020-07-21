FactoryBot.define do

  factory :user do
    nickname                {"test"}
    family_name             {"田中"}
    first_name              {"太郎"}
    family_name_kana        {"たなか"}
    first_name_kana         {"たろう"}
    birthday                {"2019-05-07"}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation   {password}
    email {Faker::Internet.free_email}
  end

end