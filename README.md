# README

This README would normally document whatever steps are necessary to get the
application up and running.

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null:false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :products
- has_many :comments
- has_many :favorites
- has_many :products
- has_one: send_destination

## send_destinations

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|integer|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|introduce|text|null: false|
|price|integer|null: false|
|kind|string|null: false|
|brand|string|null: false|
|condition|string|null: false|
|postage|string|null: false|
|shipment|string|null: false|
|shipping_area|string|null: false|
|sold_out_flg|boolean|null: false, default: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :users
- belongs_to_active_hash :kind
- belongs_to_active_hash :brand
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :shipment
- belongs_to_active_hash :shipping_area


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product|references|foreign_key: true|

### Association
- belongs_to :product

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|product|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|unique: true|

### Association
- belongs_to :user