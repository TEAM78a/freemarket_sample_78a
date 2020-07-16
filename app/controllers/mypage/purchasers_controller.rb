class Mypage::PurchasersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @buyer_products = BuyerUser.where(user_id: current_user.id)
    # @products_soldout = Product.where(user_id: current_user.id).where(sold_out_flg: 1)
  end
end
