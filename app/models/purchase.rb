class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :purchase_images
  belongs_to :user
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to_active_hash :kind
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :prefecture

  validates :name, :introduce, :price, :kind_id, :brand_id, :condition_id, :postage_id, :shipment_id, :prefecture_id, :images, presence: true
  # accepts_nested_attributes_for :purchase_images, allow_destroy: true
end
