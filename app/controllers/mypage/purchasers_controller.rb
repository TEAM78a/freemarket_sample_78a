class Mypage::PurchasersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @buyer_products = BuyerUser.where(user_id: current_user.id)
  end
end
