class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :users
  belongs_to_active_hash :kind
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :prefecture

  accepts_nested_attributes_for :images, allow_destroy: true
end
