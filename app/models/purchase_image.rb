class PurchaseImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :purchase
end
