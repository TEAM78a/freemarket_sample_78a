class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
  belongs_to_active_hash :kind
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :prefecture

  validates :name, :introduce, :price, :kind_id, :brand_id, :condition_id, :postage_id, :shipment_id, :prefecture_id, :images, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.top_search(search)
    return Product.all unless search
    Product.where('name LIKE(?)', "%#{search}%")
  end
end
