class BuyerUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :buyer_user, optional: true
end
