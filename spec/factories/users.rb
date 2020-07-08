FactoryBot.define do

  factory :user do
    nickname                {"test"}
    family_name             {"田中"}
    first_name              {"太郎"}
    family_name_kana        {"たなか"}
    first_name_kana         {"たろう"}
    birthday                {"2019-05-07"}
    email                   {"test@gmail.com"}
    password                {"1234567"}
    password_confirmation   {"1234567"}
  end

end