class SendDestination < ApplicationRecord
  belongs_to :user, optional: true

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, 
            :postal_code, :prefectures, :municipalities, :address, :phone_number, presence: true
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :postal_code, :phone_number, numericality: true
end