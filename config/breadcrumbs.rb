crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :favorites do
  link "お気に入り", mypage_favorites_path
  parent :mypage
end

crumb :listings do
  link "出品商品", mypage_listings_path
  parent :mypage
end

crumb :purchasers do
  link "購入商品", mypage_purchasers_path
  parent :mypage
end

crumb :cards do
  link "カード情報", mypage_cards_path
  parent :mypage
end

crumb :cards_new do
  link "新規登録", new_mypage_card_path
  parent :cards
end

crumb :logout do
  link "ログアウト", mypage_logout_path
  parent :mypage
end

crumb :products do
  link "商品一覧", products_path
end

crumb :product_show do
  link "商品詳細", product_path(:id)
  parent :products
end

crumb :product_new do
  link "商品登録", new_product_path(:id)
  parent :products
end

crumb :product_edit do
  link "商品編集", edit_product_path(:id)
  parent :products
end

crumb :purchase do
  link "購入確認", purchase_products_path(:id)
  parent :products
end

crumb :done do
  link "購入完了", done_products_path
  parent :products
end