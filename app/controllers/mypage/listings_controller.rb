class Mypage::ListingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products_sale = Product.where(user_id: current_user.id).where(sold_out_flg: 0)
    @products_soldout = Product.where(user_id: current_user.id).where(sold_out_flg: 1)
  end
end
