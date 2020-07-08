FactoryBot.define do

  factory :send_destination do
    family_name             {"田中"}
    first_name              {"太郎"}
    family_name_kana        {"たなか"}
    first_name_kana         {"たろう"}
    postal_code             {"1234567"}
    prefectures             {"北海道"}
    municipalities          {"札幌市中央区"}
    address                 {"旭ケ丘1丁目"}
    building                {"すごいビル 2F 101号室"}
    phone_number            {"08012345678"}
    user
  end

end