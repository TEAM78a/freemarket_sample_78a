FactoryBot.define do
  factory :product do
    id                             {"1"}
    name                           {"犬と猿"}
    introduce                      {"動物のイラスト"}
    price                          {"30"}
    kind_id                        {"1"}
    brand_id                       {"1"}
    condition_id                   {"1"}
    postage_id                     {"1"}
    shipment_id                    {"1"}
    prefecture_id                  {"1"}
    user_id                        {"1"}
    after(:build) do |product|
      product.images << build_list(:image, 2, product: product)
    end
  end
end