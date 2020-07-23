class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :kind
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :prefecture
  has_one :buyer_user

  validates :name, :introduce, :price, :kind_id, :brand_id, :condition_id, :postage_id, :shipment_id, :prefecture_id, :images, presence: true
  validates :price, length: { minimum: 3 }
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.top_search(search)
    return Product.where.not(sold_out_flg: 2) unless search
    Product.where('name LIKE(?)', "%#{search}%").where.not(sold_out_flg: 2)
  end
end
