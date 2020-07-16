class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday ,presence: true
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  validates_uniqueness_of :email, case_sensitive: false

  has_one :send_destination
  has_many :cards
  has_many :products
  has_many :comments
end
